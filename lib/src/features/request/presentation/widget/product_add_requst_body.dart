import 'package:byutinagae/src/common/widget/text_button/custom_fill_text_button.dart';
import 'package:byutinagae/src/common/widget/text_form_field/custom_text_form_filed.dart';
import 'package:byutinagae/src/features/request/domain/model/request_additional_product_model.dart';
import 'package:byutinagae/src/features/request/domain/provider/request_product_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/app_color.dart';
import 'package:byutinagae/src/config/constant/app_name.dart';

class ProductAddRequestBody extends StatefulWidget {
  final FocusNode focusNode;
  const ProductAddRequestBody({super.key, required this.focusNode});

  @override
  State<ProductAddRequestBody> createState() => _ProductAddRequestBodyState();
}

class _ProductAddRequestBodyState extends State<ProductAddRequestBody> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    widget.focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 34),
        const Text(
          '찾으시는 제품이 없나요?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          '추가되었으면 하는 제품을',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          '아래에 입력해주세요.',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 55),
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
                  focusNode: widget.focusNode,
                  controller: textController,
                  onChanged: (value) => setState(() => value),
                  onTap: () => setState(() => widget.focusNode.requestFocus()),
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
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Consumer(
              builder: (context, ref, child) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 21.0),
                child: CustomFilledTextButton(
                  w: MediaQuery.of(context).size.width,
                  h: 55,
                  content: '$APP_NAME 팀에게 보내기',
                  onPressed: textController.text != ''
                      ? () async {
                          final model = RequestAdditionalProductModel(
                            content: textController.text.trim(),
                            createdAt: Timestamp.now(),
                            uid: '',
                          );
                          ref
                              .read(requestProductRepositoryProvider)
                              .addRequestProduct(model);
                          setState(() => textController.clear());
                          showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.of(context).pop();
                              });
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: const Text(
                                  '소중한 의견 고마워요 :)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          );
                        }
                      : null,
                  backgroundColor: textController.text != ''
                      ? PRIMARY_COLOR
                      : LIGHT_GREY_COLOR.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
        ),
      ],
    );
  }
}
