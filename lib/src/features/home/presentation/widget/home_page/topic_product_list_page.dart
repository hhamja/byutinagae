// import 'package:byutinagae/src/common/widget/async_value/custom_error_data.dart';
// import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
// import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
// import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
// import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
// import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
// import 'package:byutinagae/src/features/home/presentation/provider/category_tabbar_label_provider.dart';
// import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
// import 'package:byutinagae/src/features/home/presentation/widget/appbar_search_icon.dart';
// import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/category_tabbar.dart';
// import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/product_list_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // 클린뷰티템, 인기제품 리스트 보여주는 페이지
// class TopicProductListPage extends ConsumerStatefulWidget {
//   final String topic;
//   final ProviderListenable provider;

//   const TopicProductListPage(
//       {required this.provider, required this.topic, super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _TopicProductListPageState();
// }

// class _TopicProductListPageState extends ConsumerState<TopicProductListPage>
//     with TickerProviderStateMixin {
//   final ScrollController _scrollController = ScrollController();

//   late final List<String> _tabLabelList;
//   late TabController _tabController;
//   late PageController _pageController;
//   int _currentIndex = 0;

//   void _pageChange() {
//     setState(() => _currentIndex = _tabController.index);
//   }

//   void _handleTabChange(int index) {
//     _pageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabLabelList = ref.read(tabLabelProvider(null));
//     _tabController = TabController(length: _tabLabelList.length, vsync: this);
//     _pageController = PageController(initialPage: _currentIndex);
//     _pageController.addListener(_pageChange);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _pageController.removeListener(_pageChange);
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 4개로 나뉭진 카테고리에 따라 탭바랑 상위 title도 다르게 구성하기
//     return DefaultTabController(
//       length: AllProductLine.values.length,
//       child: DefaultLayout(
//         leading: const CustomBackButton(),
//         title: Text(widget.topic),
//         actions: const [AppbarSearchIcon()],
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CategoryTabbar(
//                 ontap: _handleTabChange,
//                 tabController: _tabController,
//                 tabLabelList: _tabLabelList),
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 padEnds: true,
//                 itemCount: _tabLabelList.length,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentIndex = index;
//                     _tabController.index = index;
//                   });
//                 },
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, pageIndex) =>
//                     ref.watch(widget.provider).when(
//                         data: (list) => ListView.builder(
//                             itemCount: list.length,
//                             controller: _scrollController,
//                             itemBuilder: (context, index) => ProductListItem(
//                                 onTap: () async {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               DetailProductPage(
//                                                   productModel: list[index])));
//                                 },
//                                 brand: list[index].brand,
//                                 photoUrl: list[index].thumbnailImage,
//                                 price: list[index].price,
//                                 productName: list[index].productName,
//                                 volume: list[index].volume)),
//                         error: (error, stackTrace) => const CustomErrorData(),
//                         loading: () => const CustomCircularLoading()),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
