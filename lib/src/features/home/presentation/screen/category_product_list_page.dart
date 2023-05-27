import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/features/home/presentation/provider/category_tabbar_label_provider.dart';
import 'package:byutinagae/src/features/home/presentation/provider/product_list_provider.dart';
import 'package:byutinagae/src/features/home/presentation/widget/appbar_search_icon.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/category_tabbar.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/product_list_item.dart';

class CategoryProductListPage extends ConsumerStatefulWidget {
  // skincare, deodorant, wash, dentalcare
  final TopProductCategory productCategory;
  final String categoryTitle;

  const CategoryProductListPage(
      {required this.categoryTitle, required this.productCategory, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryProductListPageState();
}

class _CategoryProductListPageState
    extends ConsumerState<CategoryProductListPage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final List<String> _tabLabelList;
  late TabController _tabController;
  late PageController _pageController;
  bool isFetchMore = false;
  int _currentIndex = 0;

  // 페이지네이션 스크롤 리스너
  Future<void> _scrollListener() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      // 값을 더 받을 상태
      isFetchMore = true;
    } else {
      // 값을 더 받지 X 않는 상태
      isFetchMore = false;
    }
  }

  Future _pageChange() async {
    setState(() => _currentIndex = _tabController.index);
  }

  Future _handleTabChange(int index) async {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();

    _tabLabelList = ref.read(tabLabelProvider(widget.productCategory));
    _tabController = TabController(length: _tabLabelList.length, vsync: this);
    _pageController = PageController(initialPage: _currentIndex);
    _pageController.addListener(_pageChange);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.removeListener(_pageChange);
    _pageController.dispose();
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categoryList =
        ref.read(categoryListProvider(widget.productCategory));
    final queryCategoryProducts =
        ref.watch(categoryProductsProvider(categoryList[_currentIndex]));

    // 4개로 나뉭진 카테고리에 따라 탭바랑 상위 title도 다르게 구성하기
    return DefaultLayout(
      leading: const CustomBackButton(),
      title: Text(widget.categoryTitle),
      actions: const [AppbarSearchIcon()],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTabbar(
              ontap: _handleTabChange,
              tabController: _tabController,
              tabLabelList: _tabLabelList),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              padEnds: true,
              itemCount: _tabLabelList.length,
              onPageChanged: (index) async {
                setState(() {
                  _currentIndex = index;
                  _tabController.index = index;
                });
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, pageIndex) =>
                  FirestoreQueryBuilder<ProductModel>(
                query: queryCategoryProducts,
                builder: (context, snapshot, child) {
                  if (snapshot.isFetching) {
                    // 로딩
                    return const CustomCircularLoading();
                  } else if (snapshot.hasError) {
                    // 에러
                    return const SizedBox.shrink();
                  } else if (snapshot.docs.isEmpty) {
                    // 빈 데이터인 경우
                    return const Text('텅비었개');
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.docs.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final ProductModel productModel =
                          snapshot.docs[index].data();
                      // fetch 묶음 데이터의 마지막 순번인 경우 값 더 받기
                      // if (snapshot.hasMore &&
                      //     (index + 1 == snapshot.docs.length)) {
                      //   snapshot.fetchMore();
                      // }
                      if (isFetchMore) {
                        snapshot.fetchMore();
                        isFetchMore = false;
                      }
                      return ProductListItem(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailProductPage(
                                        productModel: productModel)));
                          },
                          brand: productModel.brand,
                          photoUrl: productModel.thumbnailImage,
                          price: productModel.price,
                          productName: productModel.productName,
                          volume: productModel.volume);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
