import 'package:byutinagae/src/features/search/presentation/screen/push_search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarSearchIcon extends StatelessWidget {
  const AppbarSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PushSearchPage()));
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Icon(CupertinoIcons.search),
      ),
    );
  }
}
