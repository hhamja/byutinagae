import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/features/home/presentation/screen/detail_product_page.dart';
import 'package:byutinagae/src/features/home/presentation/widget/home_page/product_card.dart';
import 'package:flutter/material.dart';

class HomeProductCardPreview extends StatelessWidget {
  final List<ProductModel> productList;

  const HomeProductCardPreview({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    const double rowInterval = 8;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ProductCard(
                  photoUrl: productList[0].thumbnailImage,
                  brand: productList[0].brand,
                  productName: productList[0].productName,
                  volume: productList[0].volume,
                  price: productList[0].price,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                        productModel: productList[0],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: rowInterval),
              Expanded(
                child: ProductCard(
                  photoUrl: productList[1].thumbnailImage,
                  brand: productList[1].brand,
                  productName: productList[1].productName,
                  volume: productList[1].volume,
                  price: productList[1].price,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                        productModel: productList[1],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: rowInterval),
              Expanded(
                child: ProductCard(
                  photoUrl: productList[2].thumbnailImage,
                  brand: productList[2].brand,
                  productName: productList[2].productName,
                  volume: productList[2].volume,
                  price: productList[2].price,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                        productModel: productList[2],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // 홈페이지 양옆 패딩과 같게 해줌
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ProductCard(
                  photoUrl: productList[3].thumbnailImage,
                  brand: productList[3].brand,
                  productName: productList[3].productName,
                  volume: productList[3].volume,
                  price: productList[3].price,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                        productModel: productList[3],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: rowInterval),
              Expanded(
                child: ProductCard(
                  photoUrl: productList[4].thumbnailImage,
                  brand: productList[4].brand,
                  productName: productList[4].productName,
                  volume: productList[4].volume,
                  price: productList[4].price,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                        productModel: productList[4],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: rowInterval),
              Expanded(
                child: ProductCard(
                  photoUrl: productList[5].thumbnailImage,
                  brand: productList[5].brand,
                  productName: productList[5].productName,
                  volume: productList[5].volume,
                  price: productList[5].price,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                        productModel: productList[5],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
