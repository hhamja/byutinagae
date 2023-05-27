import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/request/presentation/screen/home_product_add_request_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_page.dart';
import 'package:byutinagae/src/features/search/presentation/screen/home_search_page.dart';
import 'package:byutinagae/src/features/setting/presentation/screen/setting_page.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int tabbarIndex = 0;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 4, vsync: this, animationDuration: Duration.zero);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      tabbarIndex = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomePage(),
          HomeSearchPage(),
          HomeProductAddRequestPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 선택 O 탭바 아이템 스타일
        selectedItemColor: PRIMARY_COLOR,
        // 선택 X 탭바 아이템 스타일
        unselectedItemColor: GREY_COLOR,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => controller.animateTo(index),
        backgroundColor: WHITE_COLOR,
        currentIndex: tabbarIndex,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            activeIcon: Icon(CupertinoIcons.search_circle_fill),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_app),
            activeIcon: Icon(CupertinoIcons.plus_app_fill),
            label: '제품 요청',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear),
            activeIcon: Icon(CupertinoIcons.gear_alt_fill),
            label: '설정',
          ),
        ],
      ),
    );
  }
}
