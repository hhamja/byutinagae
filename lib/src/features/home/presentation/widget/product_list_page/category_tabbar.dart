import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:flutter/material.dart';

class CategoryTabbar extends StatelessWidget {
  final TabController? tabController;
  final void Function(int) ontap;
  final List<String> tabLabelList;

  const CategoryTabbar(
      {super.key,
      this.tabController,
      required this.ontap,
      required this.tabLabelList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: TabBar(
          controller: tabController,
          onTap: ontap,
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
