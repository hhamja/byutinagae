import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeShowMoreTitleText extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const HomeShowMoreTitleText(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '더보기',
                  style: TextStyle(
                    fontSize: 14,
                    color: GREY_COLOR,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 16,
                  color: GREY_COLOR,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
