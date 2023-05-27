import 'package:byutinagae/src/config/constant/category_constant.dart';
import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/presentation/provider/clean_beauty_provider.dart';
import 'package:byutinagae/src/features/home/presentation/provider/popular_provider.dart';
import 'package:byutinagae/src/features/home/presentation/screen/clean_beauty_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/popular_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_product_category_tabbar.dart';
import 'package:byutinagae/src/features/home/presentation/widget/appbar_search_icon.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_product_card_preview.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_product_list_preview.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_title_text.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_category_icon.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_banner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  String cleanBeautyCategory = '';
  final ScrollController scrollController = ScrollController();
  // firest : 인기템
  // second : 클린뷰티템
  late TabController _tabController;
  late PageController _pageController;

  int _currentIndex = 0;

  void _pageChange() {
    setState(() => _currentIndex = _tabController.index);
  }

  void _handleTabChange(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
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
    final previewCleanBeauty = ref.watch(previewCleanBeautyProductsProvider);
    final previewPopular = ref.watch(previewPopularProductsProvider);

    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset('assets/app_logo/byutinagae.png'),
          ),
          leadingWidth: MediaQuery.of(context).size.width * 0.2,
          actions: const [AppbarSearchIcon()],
        ),
        body: SingleChildScrollView(
            controller: scrollController,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // 배너
              const HomeBanner(),
              const SizedBox(height: 34),
              // 카테고리 아이콘
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeCategoryIcon(
                      categoryText: CategoryConstant.wash,
                      iconPath: './assets/icons/wash_icon.png',
                      productCategory: TopProductCategory.wash,
                    ),
                    HomeCategoryIcon(
                      categoryText: CategoryConstant.skincare,
                      iconPath: './assets/icons/skincare_icon.png',
                      productCategory: TopProductCategory.skincare,
                    ),
                    HomeCategoryIcon(
                      categoryText: CategoryConstant.dentalcare,
                      iconPath: './assets/icons/dentalcare_icon.png',
                      productCategory: TopProductCategory.dentalcare,
                    ),
                    HomeCategoryIcon(
                        categoryText: CategoryConstant.deodorant,
                        iconPath: './assets/icons/deodorant_icon.png',
                        productCategory: TopProductCategory.deodorant)
                  ]),
              const SizedBox(height: 55),
              // 인기 제품
              HomeShowMoreTitleText(
                  text: '인기 제품',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PopularListPage()))),
              const SizedBox(height: 21),
              previewPopular.when(
                  data: (list) => HomeProductCardPreview(productList: list),
                  error: (e, _) => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink()),
              const SizedBox(height: 55),
              // 클린뷰티템
              HomeShowMoreTitleText(
                  text: '뷰티나개 선정 클린뷰티템',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CleanBeautyListPage()))),
              const SizedBox(height: 21),
              HomeProductCategoryTabbar(
                ontap: _handleTabChange,
                tabController: _tabController,
              ),
              previewCleanBeauty.when(
                  data: (list) => SizedBox(
                        height: 500,
                        child: HomePreviewProductList(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                              _tabController.index = index;
                            });
                          },
                          productList: list,
                        ),
                      ),
                  error: (e, _) => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink())
            ])));
  }
}
