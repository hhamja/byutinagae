import 'package:byutinagae/src/common/widget/icon_button/custom_close_button.dart';
import 'package:byutinagae/src/common/widget/loading/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/webview_url.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 개인젇보처리방침 웹뷰
class PersonalInformationPolicyPage extends StatefulWidget {
  const PersonalInformationPolicyPage({super.key});

  @override
  State<PersonalInformationPolicyPage> createState() =>
      _PersonalInformationPolicyPageState();
}

class _PersonalInformationPolicyPageState
    extends State<PersonalInformationPolicyPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // 웹뷰 컨트롤러
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
          // 로딩 시
          onProgress: (int progress) => const CustomCircularLoading(),
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          // 페이지 에러 시
          onWebResourceError: (WebResourceError error) =>
              const SizedBox.shrink()))
      ..loadRequest(
        Uri.parse(
          UrlLauncher.privacyPolicyUrl,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE_COLOR,
        automaticallyImplyLeading: false,
        actions: const [CustomCloseButton()],
      ),
      body: Container(
        color: WHITE_COLOR,
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
