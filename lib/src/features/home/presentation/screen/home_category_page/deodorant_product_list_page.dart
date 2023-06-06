import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/presentation/provider/product_list_provider.dart';
import 'package:byutinagae/src/features/home/presentation/widget/appbar_search_icon.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/category_product_list_body.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/category_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeodorantProductListPage extends ConsumerStatefulWidget {
  const DeodorantProductListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryProductListPageState();
}

class _CategoryProductListPageState
    extends ConsumerState<DeodorantProductListPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  bool isFetchMore = false;
  int _currentIndex = 0;

  _pageChange() {
    setState(() => _currentIndex = _tabController.index);
  }

  _handleTabChange(int index) {
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
        TabController(length: DeodorantCategory.values.length, vsync: this);
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
    final provider =
        ref.watch(categoryProductsProvider(DeodorantCategory.deodorant.name));
    // 4개로 나뉭진 카테고리에 따라 탭바랑 상위 title도 다르게 구성하기
    return DefaultLayout(
      leading: const CustomBackButton(),
      title: const Text('탈취제'),
      actions: const [AppbarSearchIcon()],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTabbar(
            ontap: _handleTabChange,
            tabController: _tabController,
            tabLabelList: const ['탈취제'],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _tabController.index = index;
                });
              },
              children: DeodorantCategory.values
                  .map((e) => CategoryProductListBody(query: provider))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}