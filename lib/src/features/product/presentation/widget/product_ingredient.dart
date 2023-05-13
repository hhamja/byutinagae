import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';

class ProductIngredientBox extends StatelessWidget {
  final int totalIngredient;
  final int riskIngredient;
  final void Function() onTap;

  const ProductIngredientBox({
    super.key,
    required this.totalIngredient,
    required this.riskIngredient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                '성분',
                style: TextStyle(
                  fontSize: 20,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                CupertinoIcons.right_chevron,
                size: 20,
                color: GREY_COLOR,
              ),
            ],
          ),
          const SizedBox(height: 31),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '전성분',
                style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  color: DARK_GREY_COLOR,
                ),
              ),
              Text(
                '$totalIngredient개',
                style: const TextStyle(
                  fontSize: 16,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 23),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '중간 위험도 이상의 성분',
                style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  color: DARK_GREY_COLOR,
                ),
              ),
              Text(
                '$riskIngredient개',
                style: const TextStyle(
                  fontSize: 16,
                  height: 1,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
