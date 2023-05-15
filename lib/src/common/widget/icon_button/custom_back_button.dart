import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => Navigator.pop(context),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 16, 10),
        child: Icon(CupertinoIcons.back),
      ),
    );
  }
}
