import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/home/presentation/provider/category_tabbar_label_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProductCategoryTabbar extends ConsumerWidget {
  final TabController? tabController;
  final void Function(int) ontap;

  const HomeProductCategoryTabbar(
      {super.key, this.tabController, required this.ontap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> tabLabelList = ref.watch(tabLabelProvider(null));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 40,
        child: TabBar(
          controller: tabController,
          onTap: ontap,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.5),
          isScrollable: true,
          indicatorWeight: 8.0,
          indicatorPadding: const EdgeInsets.all(15),
          labelColor: TEXT_COLOR,
          indicatorColor: SECONDARY_COLOR.withOpacity(0.5),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          unselectedLabelColor: GREY_COLOR,
          tabs: tabLabelList.map((label) => Tab(child: Text(label))).toList(),
        ),
      ),
    );
  }
}
