import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';

class ProductDetailBox extends StatelessWidget {
  final String brand;
  final String productName;
  final String volume;
  final String price;

  const ProductDetailBox({
    super.key,
    required this.brand,
    required this.productName,
    required this.volume,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          brand,
          style: const TextStyle(
            fontSize: 16,
            color: GREY_COLOR,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          productName,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            color: TEXT_COLOR,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '$volume / $price',
          style: const TextStyle(
            fontSize: 16,
            color: GREY_COLOR,
          ),
        ),
      ],
    );
  }
}
