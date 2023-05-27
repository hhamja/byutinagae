import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String photoUrl;
  final String brand;
  final String productName;
  final String volume;
  final String price;
  final void Function() onTap;
  const ProductCard(
      {super.key,
      required this.photoUrl,
      required this.brand,
      required this.productName,
      required this.volume,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(photoUrl)),
          const SizedBox(height: 8),
          Text(
            brand,
            style: const TextStyle(
              fontSize: 14,
              color: GREY_COLOR,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            productName,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: TEXT_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
