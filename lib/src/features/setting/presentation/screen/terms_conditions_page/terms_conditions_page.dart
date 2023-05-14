import 'package:flutter/material.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/webview_url.dart';
import 'package:byutinagae/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:byutinagae/src/features/common/presentation/widget/icon_button/custom_close_button.dart';
import 'package:byutinagae/src/features/common/presentation/widget/loading/circular_loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 역할 : 이용약관 웹뷰
class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({super.key});

  @override
  State<TermsConditionsPage> createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // 웹뷰 컨트롤러
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          // 로딩 시
          onProgress: (int progress) {
            const CustomCircularLoading();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },

          // 페이지 에러 시
          onWebResourceError: (WebResourceError error) {
            const CustomErrorData();
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          UrlLauncher.termsUrl,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE_COLOR,
        automaticallyImplyLeading: false,
        actions: const [
          CustomCloseButton(),
        ],
      ),
      body: Container(
        color: WHITE_COLOR,
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
