import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/features/request/presentation/widget/product_add_requst_body.dart';

class ProductAddRequestPage extends StatefulWidget {
  const ProductAddRequestPage({super.key});

  @override
  State<ProductAddRequestPage> createState() => _ProductAddRequestPageState();
}

class _ProductAddRequestPageState extends State<ProductAddRequestPage> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => focusNode.unfocus(),
      onVerticalDragDown: (_) async => focusNode.unfocus(),
      child: DefaultLayout(
        leading: const CustomBackButton(),
        body: ProductAddRequestBody(focusNode: focusNode),
      ),
    );
  }
}
