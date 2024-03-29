// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:byutinagae/src/common/screen/tabbar/tabbar_page.dart';
import 'package:byutinagae/src/common/screen/terms_policy_agreement/terms_policy_agreement.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // void routerInitialPage() async {
    //   // 앱을 처음 키는지 확인하는 변수 받기
    //   final prefs = await SharedPreferences.getInstance();
    //   // isfirstOpenApp ? 앱을 처음키는게 아닌 경우 : 앱을 처음 키는 경우
    //   final bool isfirstOpenApp = prefs.getBool('isfirstOpenApp') ?? true;
    //   // 첫 화면 설정
    //   if (isfirstOpenApp) {
    //     // 설치 후 처음 실행
    //     // 앱 권한 사용 안내 페이지로 이동
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => const TermsPolicyAgreementPage()),
    //     );
    //   } else {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => const TabbarPage()),
    //     );
    //   }
    // }

    // 1초 뒤 홈페이지 이동
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const TabbarPage())));

    return WillPopScope(
      // 해당 위젯은 취소키 방지 역할
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: WHITE_COLOR,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  Image.asset('assets/app_logo/byutinagae.png',
                      width: MediaQuery.of(context).size.width * 0.3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
