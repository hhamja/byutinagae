import 'package:byutinagae/src/common/widget/default_layout/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/search/presentation/widget/search_page_body.dart';

class HomeSearchPage extends ConsumerStatefulWidget {
  const HomeSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends ConsumerState<HomeSearchPage> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => focusNode.unfocus(),
      onVerticalDragDown: (_) async => focusNode.unfocus(),
      child: DefaultLayout(
        body: SearchPageBody(focusNode: focusNode),
      ),
    );
  }
}
