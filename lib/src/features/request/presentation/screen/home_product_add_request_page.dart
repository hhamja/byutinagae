import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:byutinagae/src/features/request/presentation/widget/product_add_requst_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProductAddRequestPage extends ConsumerStatefulWidget {
  const HomeProductAddRequestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeProductAddRequestPageState();
}

class _HomeProductAddRequestPageState
    extends ConsumerState<HomeProductAddRequestPage> {
  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return GestureDetector(
      onTap: () async => focusNode.unfocus(),
      onVerticalDragDown: (_) async => focusNode.unfocus(),
      child: DefaultLayout(
        body: ProductAddRequestBody(focusNode: focusNode),
      ),
    );
  }
}
