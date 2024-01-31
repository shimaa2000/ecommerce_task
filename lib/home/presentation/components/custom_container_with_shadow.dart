import 'package:ecommerce/core/managers/color_manager.dart';
import 'package:flutter/material.dart';


class CustomContainerWithShadow extends StatelessWidget {
  const CustomContainerWithShadow(
      {super.key, this.width, required this.child, this.color});

  final double? width;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: width ?? MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: color ?? ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
