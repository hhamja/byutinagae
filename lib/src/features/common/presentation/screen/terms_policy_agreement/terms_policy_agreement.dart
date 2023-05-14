import 'package:byutinagae/src/features/setting/presentation/screen/personal_information_policy_page/personal_information_policy_page.dart';
import 'package:byutinagae/src/features/setting/presentation/screen/terms_conditions_page/terms_conditions_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/features/common/presentation/screen/tabbar/tabbar_page.dart';

import 'package:byutinagae/src/features/common/presentation/widget/text_button/custom_fill_text_button.dart';
import 'package:byutinagae/src/features/common/presentation/widget/check_box_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 역할 : 앱 설치 후, 개인정보처리방침 및 이용약관에 동의 페이지 UI
class TermsPolicyAgreementPage extends StatefulWidget {
  const TermsPolicyAgreementPage({super.key});

  @override
  State<TermsPolicyAgreementPage> createState() =>
      _TermsPolicyAgreementPageState();
}

class _TermsPolicyAgreementPageState extends State<TermsPolicyAgreementPage> {
  late bool _isButtonValid;
  late bool _isConfirmedTerms;
  late bool _isConfirmedPrivacyPolicy;

  @override
  void initState() {
    super.initState();
    _isButtonValid = false;
    _isConfirmedTerms = false;
    _isConfirmedPrivacyPolicy = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/app_icon/byutinagae.png',
              width: 150,
            ),
            const SizedBox(height: 55),
            const Text(
              '안녕하세요',
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '반가워요 :)',
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 89 + 55,
            ),
            // 전체 동의
            CustomCircleCheckBoxTile(
              isChecked: _isConfirmedTerms && _isConfirmedPrivacyPolicy,
              onTap: () async {
                setState(() {
                  _isButtonValid = !_isButtonValid;
                  _isConfirmedTerms = _isButtonValid;
                  _isConfirmedPrivacyPolicy = _isButtonValid;
                });
              },
              content: '전체 동의',
              trailing: null,
            ),
            const Divider(
              thickness: 1,
              height: 10,
              color: LIGHT_GREY_COLOR,
            ),
            // 이용약관 동의
            CustomCircleCheckBoxTile(
              isChecked: _isConfirmedTerms,
              onTap: () async =>
                  setState(() => _isConfirmedTerms = !_isConfirmedTerms),
              content: '이용약관 동의(필수)',
              trailing: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
                // 이용약관 노션 페이지 이동
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsConditionsPage(),
                    ),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.right_chevron,
                  size: 21,
                  color: GREY_COLOR,
                ),
              ),
            ),

            // 개인정보 방침 동의
            CustomCircleCheckBoxTile(
              isChecked: _isConfirmedPrivacyPolicy,
              onTap: () => setState(
                  () => _isConfirmedPrivacyPolicy = !_isConfirmedPrivacyPolicy),
              content: '개인정보 수집 및 이용동의(필수)',
              trailing: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
                // 개인정보 동의 노션 페이지로 이동
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PersonalInformationPolicyPage(),
                    ),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.right_chevron,
                  size: 21,
                  color: GREY_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),

      // 핸드폰 페이지로 이동 버튼
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 34),
        child: CustomFilledTextButton(
          w: MediaQuery.of(context).size.width,
          h: 50,
          content: '다음',
          onPressed: _isConfirmedTerms && _isConfirmedPrivacyPolicy
              ? () async {
                  // 홈 페이지로 페이지 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabbarPage(),
                    ),
                  );
                  final prefs = await SharedPreferences.getInstance();
                  // isfirstOpenApp를 false로 업데이트
                  prefs.setBool('isfirstOpenApp', false);
                }
              : null,
          backgroundColor: _isConfirmedTerms && _isConfirmedPrivacyPolicy
              ? PRIMARY_COLOR
              : LIGHT_GREY_COLOR,
        ),
      ),
    );
  }
}
