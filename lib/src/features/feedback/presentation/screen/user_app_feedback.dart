import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';
import 'package:byutinagae/src/features/common/presentation/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/features/common/presentation/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/features/common/presentation/widget/text_button/custom_fill_text_button.dart';
import 'package:byutinagae/src/features/common/presentation/widget/text_form_field/custom_text_form_filed.dart';
import 'package:byutinagae/src/features/feedback/data/feedback_repository_impl.dart';

class UserAppFeedbackPage extends StatefulWidget {
  const UserAppFeedbackPage({super.key});

  @override
  State<UserAppFeedbackPage> createState() => _UserAppFeedbackPageState();
}

class _UserAppFeedbackPageState extends State<UserAppFeedbackPage> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leading: const CustomBackButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 34),
          const Text(
            '안녕하세요.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 21),
          const Text(
            '추가되었으면 하는 제품 카테고리가 있나요?',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 21),
          const Text(
            '아래에 입력하여 $APP_NAME 팀에게 알려주세요:)',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 34),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: textController.text.isNotEmpty
                      ? PRIMARY_COLOR
                      : GREY_COLOR,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    maxLine: null,
                    maxLength: 100,
                    controller: textController,
                    focusNode: focusNode,
                    onChanged: (value) => setState(() => value),
                    onTap: () => setState(() => focusNode.requestFocus()),
                    hintText: '컨디셔너, 치약, 세정제, 탈취제 …',
                  ),
                ),
                textController.text != ''
                    ? InkWell(
                        onTap: () => setState(() => textController.text = ''),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                          child: Icon(
                            Icons.close_sharp,
                            size: 25,
                            color: GREY_COLOR,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) => CustomFilledTextButton(
          w: MediaQuery.of(context).size.width,
          h: 50,
          content: '$APP_NAME 팀에게 보내기',
          onPressed: textController.text != ''
              ? () async {
                  ref
                      .read(feedbackRepositoryProvider)
                      .addUserFeedback('[카테고리] ${textController.text}');
                  textController.clear();
                  showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop();
                      });
                      return const AlertDialog(
                        title: Text(
                          '소중한 의견 고마워요 :)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    },
                  );
                }
              : null,
          backgroundColor:
              textController.text != '' ? PRIMARY_COLOR : LIGHT_GREY_COLOR,
        ),
      ),
    );
  }
}
