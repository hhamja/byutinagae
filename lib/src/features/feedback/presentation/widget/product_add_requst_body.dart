import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';
import 'package:byutinagae/src/features/common/presentation/widget/text_button/custom_fill_text_button.dart';
import 'package:byutinagae/src/features/common/presentation/widget/text_form_field/custom_text_form_filed.dart';
import 'package:byutinagae/src/features/feedback/data/feedback_repository.dart';

class ProductAddRequestBody extends StatefulWidget {
  const ProductAddRequestBody({super.key});

  @override
  State<ProductAddRequestBody> createState() => _ProductAddRequestBodyState();
}

class _ProductAddRequestBodyState extends State<ProductAddRequestBody> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 34),
        const Text(
          '찾으시는 제품이 없나요?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 21),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color:
                    textController.text.isNotEmpty ? PRIMARY_COLOR : GREY_COLOR,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  maxLine: null,
                  maxLength: 100,
                  focusNode: focusNode,
                  controller: textController,
                  onChanged: (value) => setState(() => value),
                  onTap: () => setState(() => focusNode.requestFocus()),
                  hintText: '요청할 제품 명을 입력해주세요 :)',
                ),
              ),
              textController.text.isNotEmpty
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
        const SizedBox(height: 55),
        Consumer(
          builder: (context, ref, child) => CustomFilledTextButton(
            w: MediaQuery.of(context).size.width,
            h: 50,
            content: '$APP_NAME 팀에게 보내기',
            onPressed: textController.text != ''
                ? () async {
                    ref
                        .read(feedbackRepositoryProvider)
                        .addUserFeedback('[제품] ${textController.text}');
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
      ],
    );
  }
}
