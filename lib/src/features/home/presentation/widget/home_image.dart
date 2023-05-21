import 'package:flutter/material.dart';

class HomePageImg extends StatelessWidget {
  const HomePageImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      './assets/images/Cover (5).png',
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.3,
    );
  }
}
