import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/config/constant/category_constant.dart';
import 'package:byutinagae/src/features/home/presentation/provider/popular_provider.dart';
import 'package:byutinagae/src/features/home/presentation/widget/appbar_search_icon.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/category_tabbar.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/topic_product_list_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 카테고리 별 인기제품 리스트 페이지
class PopularListPage extends ConsumerStatefulWidget {
  const PopularListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PopularListPageState();
}

class _PopularListPageState extends ConsumerState<PopularListPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  int _currentIndex = 0;

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
    _tabController =
        TabController(length: Category.topCategoryList.length, vsync: this);
    _pageController = PageController(initialPage: _currentIndex);
    _pageController.addListener(_pageChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.removeListener(_pageChange);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Category.topCategoryList.length,
      child: DefaultLayout(
        leading: const CustomBackButton(),
        title: const Text('인기 제품'),
        actions: const [AppbarSearchIcon()],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryTabbar(
              ontap: _handleTabChange,
              tabController: _tabController,
              tabLabelList: Category.topCategoryList,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) async {
                  setState(() {
                    _currentIndex = index;
                    _tabController.index = index;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: Category.topCategoryList
                    .map(
                      (e) => TopicProductListBody(
                        provider: ref.watch(
                          categoryPopularProductsProvider(e),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
