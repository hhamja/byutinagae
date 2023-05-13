import 'package:flutter/material.dart';
import 'package:byutinagae/src/features/common/presentation/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/features/common/presentation/widget/icon_button/custom_back_button.dart';
import 'package:byutinagae/src/features/feedback/presentation/widget/product_add_requst_body.dart';

class ProductAddRequestPage extends StatefulWidget {
  const ProductAddRequestPage({super.key});

  @override
  State<ProductAddRequestPage> createState() => _ProductAddRequestPageState();
}

class _ProductAddRequestPageState extends State<ProductAddRequestPage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      leading: CustomBackButton(),
      body: ProductAddRequestBody(),
    );
  }
}
