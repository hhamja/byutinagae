import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';
import 'package:byutinagae/src/features/common/presentation/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/features/common/presentation/widget/icon_button/custom_back_button.dart';

class AppNoticePage extends StatelessWidget {
  const AppNoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        leading: CustomBackButton(),
        title: Text('공지사항'),
        body: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                '반려동물 피부를 위한 성분분석 앱,\n$APP_NAME 출시!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              subtitle: Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  '2023. 06. 01',
                  style: TextStyle(
                    fontSize: 14,
                    color: GREY_COLOR,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: GREY_COLOR,
            )
          ],
        ));
  }
}
