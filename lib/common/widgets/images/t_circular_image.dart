import 'package:flutter/material.dart';
import 'package:jazz/utils/constants/colors.dart';
import 'package:jazz/utils/constants/sizes.dart';
import 'package:jazz/utils/helpers/helper_function.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(48),
          child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider,
              color: overlayColor),
        ),
      ),
    );
  }
}
