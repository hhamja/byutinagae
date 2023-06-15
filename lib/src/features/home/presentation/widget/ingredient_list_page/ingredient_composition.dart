import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';

class IngredientComposition extends StatelessWidget {
  final int lowRisk;
  final int mediumRisk;
  final int highRisk;
  final int undeterminedRisk;
  const IngredientComposition({
    super.key,
    required this.lowRisk,
    required this.mediumRisk,
    required this.highRisk,
    required this.undeterminedRisk,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CompositionItem(
          backgroundColor: LOW_EWG_COLOR,
          count: lowRisk,
          title: '낮은 위험',
        ),
        CompositionItem(
          backgroundColor: MEDIUM_EWG_COLOR,
          count: mediumRisk,
          title: '중간 위험',
        ),
        CompositionItem(
          backgroundColor: HIGH_EWG_COLOR,
          count: highRisk,
          title: '높은 위험',
        ),
        CompositionItem(
          backgroundColor: NO_EWG_COLOR,
          count: undeterminedRisk,
          title: '등급 미정',
        ),
      ],
    );
  }
}

class CompositionItem extends StatelessWidget {
  final int count;
  final Color backgroundColor;
  final String title;

  const CompositionItem({
    super.key,
    required this.count,
    required this.backgroundColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              '$count개',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
