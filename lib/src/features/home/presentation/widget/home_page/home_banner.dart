import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      './assets/images/home_cover_1.png',
      alignment: Alignment.center,
    );
  }
}
