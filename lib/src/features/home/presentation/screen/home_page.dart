import 'package:byutinagae/src/config/constant/category_constant.dart';
import 'package:byutinagae/src/features/home/presentation/provider/clean_beauty_provider.dart';
import 'package:byutinagae/src/features/home/presentation/provider/popular_provider.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_category_page/dentalcare_product_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_category_page/smellcare_product_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_category_page/skincare_product_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_topic_page/clean_beauty_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_topic_page/popular_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_category_page/wash_product_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/appbar_search_icon.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_product_card_preview.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_product_list_preview.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/home_title_text.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/category_tabbar.dart';
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
  final ScrollController homeScrollController = ScrollController();
  late TabController homeTabController;
  late PageController homePageController;

  int _currentIndex = 0;

  void _pageChange() {
    setState(() => _currentIndex = homeTabController.index);
  }

  void _handleTabChange(int index) {
    homePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    homeTabController =
        TabController(length: Category.topCategoryList.length, vsync: this);
    homePageController = PageController(initialPage: _currentIndex);
    homePageController.addListener(_pageChange);
  }

  @override
  void dispose() {
    homeTabController.dispose();
    homePageController.removeListener(_pageChange);
    homePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        controller: homeScrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 배너
            const HomeBanner(),
            const SizedBox(height: 34),
            // 카테고리 아이콘
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              HomeCategoryIcon(
                  categoryText: Category.wash,
                  iconPath: './assets/icons/wash_icon.png',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WashProductListPage()))),
              HomeCategoryIcon(
                  categoryText: Category.skincare,
                  iconPath: './assets/icons/skincare_icon.png',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SkinCareProductListPage()))),
              HomeCategoryIcon(
                  categoryText: Category.dentalcare,
                  iconPath: './assets/icons/dentalcare_icon.png',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DentalCareProductListPage()))),
              HomeCategoryIcon(
                  categoryText: Category.smellcare,
                  iconPath: './assets/icons/deodorant_icon.png',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SmellcareProductListPage())))
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CategoryTabbar(
                    ontap: _handleTabChange,
                    tabController: homeTabController,
                    tabLabelList: Category.topCategoryList,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: PageView(
                controller: homePageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                    homeTabController.index = index;
                  });
                },
                children: Category.topCategoryList
                    .map(
                      (e) => HomePreviewProductList(
                        provider:
                            ref.watch(previewCleanBeautyProductsProvider(e)),
                        pageIndex: _currentIndex,
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
