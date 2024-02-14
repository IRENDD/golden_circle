import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class TDragHandle extends StatelessWidget {
  const TDragHandle({
    super.key,
    this.width = 40,
    this.height = 5,
    this.radius = 25,
    this.margin =
        const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.smm),
    this.color = TColors.textGrey,
  });

  final double width, height, radius;
  final EdgeInsetsGeometry? margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
