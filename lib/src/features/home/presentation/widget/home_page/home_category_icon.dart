import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/presentation/screen/category_product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';

class HomeCategoryIcon extends StatelessWidget {
  final String categoryText;
  final String iconPath;
  final TopProductCategory productCategory;

  const HomeCategoryIcon({
    required this.categoryText,
    required this.iconPath,
    required this.productCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryProductListPage(
                    productCategory: productCategory,
                    categoryTitle: categoryText)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: DEEP_LIGHT_GREY_COLOR,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                iconPath,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              categoryText,
              style: const TextStyle(
                color: TEXT_COLOR,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
