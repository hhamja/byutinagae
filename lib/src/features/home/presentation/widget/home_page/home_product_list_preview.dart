import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/category_constant.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/features/home/presentation/screen/home_topic_page/clean_beauty_list_page.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/product_list_page/product_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePreviewProductList extends ConsumerWidget {
  final void Function(int) onPageChanged;
  final PageController controller;
  final List<ProductModel> productList;

  const HomePreviewProductList(
      {super.key,
      required this.onPageChanged,
      required this.controller,
      required this.productList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: controller,
      itemCount: CategoryConstant.labelList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, pageIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: LIGHT_GREY_COLOR.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productList.length,
                  itemBuilder: (context, index) => ProductListItem(
                    photoUrl: productList[index].thumbnailImage,
                    brand: productList[index].brand,
                    productName: productList[index].productName,
                    volume: productList[index].volume,
                    price: productList[index].price,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProductPage(
                          productModel: productList[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CleanBeautyListPage())),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: LIGHT_GREY_COLOR.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        CategoryConstant.labelList[pageIndex],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: PRIMARY_COLOR,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '전체보기',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      const Icon(CupertinoIcons.right_chevron, size: 14),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
