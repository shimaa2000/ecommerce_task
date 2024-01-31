import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../managers/color_manager.dart';
import '../managers/font_manager.dart';
import '../managers/style_manager.dart';
import '../managers/values_manager.dart';
import 'app_view/app_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.error, required this.onPressed,this.showButton=true}) : super(key: key);
  final String error;
  final VoidCallback onPressed;
  final bool showButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: MediaQuery
                  .sizeOf(context)
                  .width / 6,
              backgroundColor: ColorManager.greyShade.withOpacity(.2),
              child: CircleAvatar(
                radius: MediaQuery
                    .sizeOf(context)
                    .width / 9,
                backgroundColor: ColorManager.greyShade.withOpacity(.4),
                child: Icon(
                  Icons.error_outline,
                  color: Colors.white,
                  size: MediaQuery
                      .sizeOf(context)
                      .width / 10,
                ),
              ),
            ),
            const SizedBox(
              height: AppPadding.p14,
            ),
            Text(
              error,
              style: getRegularStyle(
                  color: ColorManager.darkColor, fontSize: FontSize.s16),

            ),
            if(showButton)
              AppButton(
              width: MediaQuery
                  .sizeOf(context)
                  .width / 3,
              color: ColorManager.greyShade.withOpacity(.6),
              onPressed: onPressed,
              title: AppStrings.tryAgain,
            ),
            if(showButton)
              SizedBox(height:MediaQuery.sizeOf(context).height/10),
          ],
        ),
      ),
    );
  }
}
