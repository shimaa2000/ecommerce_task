import 'package:flutter/material.dart';
import '../../../../core/managers/color_manager.dart';
import '../../managers/font_manager.dart';
import '../../managers/values_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.fontSize,
    this.radius,
    this.margin,
    this.isReset = false,
    this.color,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? radius;
  final double? margin;
  final bool isReset;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: height ?? MediaQuery.sizeOf(context).height / 17,
        margin:
            EdgeInsets.all(margin ?? MediaQuery.sizeOf(context).width * .05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppRadius.r10),
          color: isReset ? ColorManager.greyShade : null,
          gradient: isReset
              ? null
              : LinearGradient(
                  colors: [
                    color ?? ColorManager.primaryColor,
                    color ?? ColorManager.gradientPrimaryColor,
                  ],
                ),
        ),
        width: width ?? double.infinity,
        child: Text(
          title,
          style: TextStyle(
              color: ColorManager.whiteColor,
              fontSize: fontSize ?? FontSize.s16),
        ),
      ),
    );
  }
}
