import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../constants/app_assets.dart';
import '../managers/color_manager.dart';
import 'error_screen.dart';


class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String placeholder;
  final bool? border;

  const CustomImage(
      {super.key,
      this.image,
      this.height,
      this.border = false,
      this.width,
      this.fit = BoxFit.cover,
      this.placeholder = AppAssets.profile});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image!,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        color: ColorManager.greyShade,
      ),
      errorWidget: (context, url, error) => ErrorScreen(
        error: 'Image isn\'t found ',
        onPressed: () {},
        showButton: false,
      ),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
