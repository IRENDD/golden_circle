import 'package:flutter/material.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/sizes.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
    this.text,
    this.textStyle,
    this.border,
    this.icon,
    this.icon1,
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final Border? border;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final Iconify? icon, icon1;
  final String? text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    List<Widget> leftGroup = []; // List for the left side (icon and text)

    // If icon is provided, add it to the leftGroup list.
    if (icon != null) {
      leftGroup.add(icon!);
      leftGroup.add(const SizedBox(width: 8));
    }

    // If text is provided, add it to the leftGroup list.
    if (text != null) {
      leftGroup.add(Text(text!,
          style: textStyle ??
              TextStyle(
                fontSize: 13,
                color: TColors.secondary.withOpacity(0.9),
                fontWeight: FontWeight.w700,
              )));
    }

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: leftGroup),
            const SizedBox(width: TSizes.spaceBtwItems / 1.5),
            if (icon1 != null) icon1!, // Add the right icon if provided
          ],
        ),
      ),
    );
  }
}
