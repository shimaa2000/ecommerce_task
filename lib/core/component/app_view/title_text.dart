import 'package:flutter/material.dart';

import '../../managers/color_manager.dart';
import '../../managers/style_manager.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key,required this.title,this.fontSize,}) : super(key: key);
  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getRegularStyle(
        color: ColorManager.darkColor.withOpacity(.6),
        fontSize:fontSize?? MediaQuery.sizeOf(context).width * .028,
      ),
    );
  }
}
