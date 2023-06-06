import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:byutinagae/src/common/widget/icon_button/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/search/presentation/widget/search_page_body.dart';

class PushSearchPage extends ConsumerStatefulWidget {
  const PushSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PushSearchPageState();
}

class _PushSearchPageState extends ConsumerState<PushSearchPage> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => focusNode.unfocus(),
      onVerticalDragDown: (_) async => focusNode.unfocus(),
      child: DefaultLayout(
        leading: const CustomBackButton(),
        body: SearchPageBody(focusNode: focusNode),
      ),
    );
  }
}
