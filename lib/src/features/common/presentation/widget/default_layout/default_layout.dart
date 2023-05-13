import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final Widget? title;
  final Widget? leading;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;

  const DefaultLayout({
    required this.body,
    this.title,
    this.leading,
    this.actions,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        title: title,
        leading: Container(
          padding: const EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
          child: leading,
        ),
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: body,
      ),
      bottomSheet: Padding(
        padding: bottomNavigationBar == null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: bottomNavigationBar,
      ),
    );
  }
}
