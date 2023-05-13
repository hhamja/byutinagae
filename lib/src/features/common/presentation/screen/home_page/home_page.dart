import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/product/presentation/screen/push_search_page.dart';
import 'package:byutinagae/src/features/product/presentation/widget/category_item.dart';
import 'package:byutinagae/src/features/product/presentation/widget/home_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/app_icon/byutinagae.png',
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        title: GestureDetector(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PushSearchPage(),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey[600]!,
              ),
            ),
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '브랜드, 제품명 검색하기…',
                    style: TextStyle(
                      color: Colors.grey[600]!,
                      height: 1.25,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomePageImg(),
            const SizedBox(height: 34),
            const Text(
              '카테고리',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 21),
            Row(
              children: [
                CategoryItem(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PushSearchPage(),
                      ),
                    );
                  },
                  categoryText: '샴푸',
                  icon: CupertinoIcons.drop,
                  iconColor: TEXT_COLOR,
                  iconSize: 40,
                ),
                CategoryItem(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PushSearchPage(),
                      ),
                    );
                  },
                  categoryText: '더보기',
                  icon: CupertinoIcons.add,
                  iconColor: TEXT_COLOR,
                  iconSize: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
