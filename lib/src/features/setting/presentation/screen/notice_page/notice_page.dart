import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';

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
                '모든 반려동물 뷰티의 시작, $APP_NAME 출시',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.0),
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
              color: LIGHT_GREY_COLOR,
            )
          ],
        ));
  }
}
