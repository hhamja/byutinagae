import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:flutter/material.dart';

class EmptyDataPage extends StatelessWidget {
  const EmptyDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: MediaQuery.of(context).size.height * 0.15),
        // SizedBox(
        //   width: 300,
        //   height: 300,
        //   child: Image.asset(
        //     './assets/images/empty_data.png',
        //   ),
        // ),
        // const SizedBox(height: 34),
        Text(
          '등록된 제품이 없어요 :(',
          style: TextStyle(
            // color: DARK_GREY_COLOR,
            fontSize: 18,
          ),
        ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.2),
      ],
    );
  }
}
