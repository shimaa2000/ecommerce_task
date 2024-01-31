import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/app_strings.dart';
import '../managers/color_manager.dart';
import '../managers/style_manager.dart';
import '../managers/values_manager.dart';
import 'app_view/app_button.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.wifi,
              color: ColorManager.greyShade,
              height: height / 4,
            ),
            Text(
              'Whoops',
              textAlign: TextAlign.center,
              textScaler:const TextScaler.linear(2),
              style: getSemiBoldStyle(
                color: ColorManager.greyShade,
                fontSize: width * .04,
              ),
            ),
            const SizedBox(
              height: AppPadding.p10,
            ),
            Text(
              AppStrings.noInternet,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                color: ColorManager.darkColor.withOpacity(.8),
                fontSize: width * .055,
              ),
            ),
            const SizedBox(
              height: AppPadding.p10,
            ),
            Text(
              AppStrings.checkConnection,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                color: ColorManager.darkColor.withOpacity(.8),
                fontSize: width * .05,
              ),
            ),
            AppButton(
              onPressed: onPressed ?? () {},
              title: AppStrings.tryAgain,
              margin: width * .2,
            ),
          ],
        ),
      ),
    );
  }
}
