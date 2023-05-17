import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';

class ProductListItem extends StatelessWidget {
  final String photoUrl;
  final String brand;
  final String productName;
  final String volume;
  final String price;
  final void Function() onTap;

  const ProductListItem({
    required this.photoUrl,
    required this.brand,
    required this.productName,
    required this.volume,
    required this.price,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                photoUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
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
                      fontSize: 16,
                      color: TEXT_COLOR,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$volume / $price',
                    style: const TextStyle(
                      fontSize: 14,
                      color: GREY_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
