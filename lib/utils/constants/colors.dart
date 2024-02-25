import 'package:flutter/material.dart';

class TColors {
  // App theme colors
  static const Color primary = Color(0xFFC09700);
  static const Color secondary = Color(0xFF6B555A);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textGrey = Color(0xFFA5A5A5);
  static Color textBrown = const Color(0xFF6B555A).withOpacity(0.8);
  static Color textLightBrown = const Color(0xFF6B555A).withOpacity(0.5);
  static const Color textWhite = Colors.white;

  // Button colors
  static Color buttonPrimary = const Color(0xFFA5A5A5).withOpacity(0.25);
  static Color buttonSecondary = const Color(0xFFE8E8E8);

  // Border colors
  static const Color borderPrimary = Color(0xFFA5A5A5);
  static Color borderPrimary2 = const Color(0xFFA5A5A5).withOpacity(0.35);
  static Color borderPrimary3 = const Color(0xFFA5A5A5).withOpacity(0.25);

  // Shadows
  static Color darkShadow = const Color(0xFF232323).withOpacity(0.25);

  /// -- Need to test them:
  ///
  ///

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  // static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
