import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';

class IngredientInfoBottomSheet extends StatelessWidget {
  const IngredientInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 420,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: WHITE_COLOR,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 34),
          Text(
            '성분정보',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 34),
          Text(
            '  $APP_NAME는 각 제품의 공개된 전성분을 바탕으로 식약처 및 EWG에서 제공되는 추가적인 성분 정보들을 추가하여 만들어진 정보를 제공합니다.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 21),
          Text(
            '  따라서 $APP_NAME에서 제공하는 성분 정보는 $APP_NAME의 입장을 대변하지 않으며, 소비자에게 절대적인 기준으로 활용될 수 없습니다. 제품 구매시 참고 정보로만 활용하시길 권장드립니다.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 21),
          Text(
            '  또한 전성분에 대한 모든 책임은 이를 제공한 브랜드 사에 있으며, 각 성분에 대한 추가 정보에 대한 모든 책임 또한 이를 제공한 기관에 있음을 알립니다.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
