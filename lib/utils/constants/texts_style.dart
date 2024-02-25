import 'package:flutter/material.dart';
import 'package:golden_circle/utils/constants/colors.dart';

class TTextStyle {
  /// -- Main HeadLine Texts
  static final TextStyle headlineLarge = TextStyle(
    color: TColors.secondary.withOpacity(0.9),
    fontWeight: FontWeight.w700,
    fontSize: 23,
    letterSpacing: -0.2,
  );

  static final TextStyle headlineMedium = TextStyle(
    color: TColors.secondary.withOpacity(0.9),
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: -0.2,
  );

  static final TextStyle headlineSmall = TextStyle(
    color: TColors.secondary.withOpacity(0.9),
    fontWeight: FontWeight.w700,
    fontSize: 19,
  );

  static final TextStyle headlineXSmall = TextStyle(
    color: TColors.secondary.withOpacity(0.9),
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  /// -- Main Title Texts
  static final TextStyle mainTitle = TextStyle(
    color: TColors.secondary.withOpacity(0.9),
    fontSize: 23,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  static final TextStyle mainSubtitle = TextStyle(
    color: TColors.secondary.withOpacity(0.5),
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  static final TextStyle mainSubtitle2 = TextStyle(
    color: TColors.secondary.withOpacity(0.7),
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  /// -- Body Texts
  static final TextStyle bodyTitle = TextStyle(
    color: TColors.textBrown.withOpacity(0.5),
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  static final TextStyle bodyTitleDark = TextStyle(
    color: TColors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  static final TextStyle bodySubtitle = TextStyle(
    color: TColors.secondary.withOpacity(0.9),
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  static final TextStyle bodySubtitle2 = TextStyle(
    color: TColors.secondary.withOpacity(0.7),
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  static const TextStyle bodySecondaryTitle = TextStyle(
    color: TColors.white,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.2,
  );

  /// -- Button Texts
  static const TextStyle secondaryLargeButton = TextStyle(
    color: TColors.white,
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle secondaryButton = TextStyle(
    color: TColors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  /// -- Event Card
  static TextStyle eventCardTitleSmall = TextStyle(
    color: TColors.secondary.withOpacity(0.9),
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.2,
  );

  static final TextStyle eventCardSubTitleSmall = TextStyle(
    color: TColors.textBrown.withOpacity(0.5),
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
  );
}
