import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';

class HomePageImg extends StatelessWidget {
  const HomePageImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.color,
          ),
          child: Image.asset(
            './assets/images/home_img.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
        const Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            '반려동물\n피부는\n소중하니까',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: WHITE_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
