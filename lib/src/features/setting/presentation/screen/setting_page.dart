import 'package:flutter/material.dart';
import 'package:byutinagae/src/features/setting/presentation/screen/notice_page/notice_page.dart';
import 'package:byutinagae/src/features/setting/presentation/screen/personal_information_policy_page/personal_information_policy_page.dart';
import 'package:byutinagae/src/features/setting/presentation/screen/terms_conditions_page/terms_conditions_page.dart';
import 'package:byutinagae/src/features/setting/presentation/widget/setting_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Column(
        children: [
          SettingTile(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppNoticePage(),
                ),
              );
            },
            title: '공지사항',
          ),
          SettingTile(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsConditionsPage(),
                ),
              );
            },
            title: '이용약관',
          ),
          SettingTile(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PersonalInformationPolicyPage(),
                ),
              );
            },
            title: '개인정보 처리방침',
          ),
        ],
      ),
    );
  }
}
