import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/texts_style.dart';

class TEventCardHorizontal extends StatelessWidget {
  const TEventCardHorizontal({
    super.key,
    this.width = 200,
    this.imageHeight = 100,
    this.showTextDate = false,
    required this.image,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.subtitleDate,
    this.subtitleFee,
    this.onPressed,
  });

  final double width;
  final double imageHeight;
  final bool showTextDate;
  final String image;
  final String title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final String? subtitleDate, subtitleFee;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: Colors.white,
          border: Border.all(
              color: TColors.borderPrimary.withOpacity(0.45), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: TColors.borderPrimary.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 7,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Thumbnail Image with Date
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(TSizes.productImageRadius),
                    topRight: Radius.circular(TSizes.productImageRadius),
                  ),
                  child: Image.asset(image,
                      width: width, height: imageHeight, fit: BoxFit.cover),
                ),

                /// -- Text of Date
                if (showTextDate)
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(TSizes.productImageRadius),
                            topRight:
                                Radius.circular(TSizes.productImageRadius)),
                      ),
                      child: const Text(
                        'Today',
                        style: TextStyle(
                            color: TColors.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
              ],
            ),

            /// -- Text Details
            Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: titleStyle ?? TTextStyle.eventCardTitleSmall),
                  if (subtitleDate != null) ...[
                    Text(subtitleDate!,
                        style:
                            subtitleStyle ?? TTextStyle.eventCardSubTitleSmall),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(subtitle,
                          style: subtitleStyle ??
                              TTextStyle.eventCardSubTitleSmall),
                      if (subtitleFee != null)
                        Text(subtitleFee!,
                            style: subtitleStyle ??
                                TTextStyle.eventCardSubTitleSmall),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
