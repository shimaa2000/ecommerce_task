import 'package:flutter/material.dart';

import '../../managers/color_manager.dart';
import '../../managers/style_manager.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
      {Key? key, required this.fontSize, required this.title, this.color})
      : super(key: key);
  final double fontSize;
  final String title;
 final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getSemiBoldStyle(
        fontSize: fontSize,
        color: color ?? ColorManager.darkColor.withOpacity(.8),
      ),
    );
  }
}
