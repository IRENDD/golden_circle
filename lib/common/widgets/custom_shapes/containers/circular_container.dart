import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    required this.width,
    this.height,
    this.radius = 15,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = TColors.white,
    this.borderColor = TColors.white,
    this.text,
    this.textStyle,
  });

  final double? width, height;
  final double radius, padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor, borderColor;
  final String? text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // Determine the content to display: text or child widget
    Widget content = child ?? Container();
    if (text != null) {
      // If text is provided, use it instead of the child widget
      content = Center(
        child: Text(text!,
            style: textStyle ??
                TextStyle(
                    fontSize: 13,
                    color: TColors.secondary.withOpacity(0.9),
                    fontWeight: FontWeight.w700)),
      );
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor, width: 2.0),
        color: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: content,
      ),
    );
  }
}
