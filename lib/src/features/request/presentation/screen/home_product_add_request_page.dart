import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/features/request/presentation/widget/product_add_requst_body.dart';

class HomeProductAddRequestPage extends StatefulWidget {
  const HomeProductAddRequestPage({super.key});

  @override
  State<HomeProductAddRequestPage> createState() =>
      _HomeProductAddRequestPageState();
}

class _HomeProductAddRequestPageState extends State<HomeProductAddRequestPage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: ProductAddRequestBody(),
    );
  }
}
