import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';

class IngredientListTile extends StatelessWidget {
  final String ewg;
  final String name;
  final String purpose;
  final Color color;
  const IngredientListTile({
    super.key,
    required this.ewg,
    required this.name,
    required this.purpose,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                ewg,
                style: const TextStyle(
                  color: Colors.white,
                  // fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: TEXT_COLOR,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '배합목적 : $purpose',
                  maxLines: null,
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
    );
  }
}
