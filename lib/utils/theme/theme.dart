import 'package:flutter/material.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/theme/widgets/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'DM Sans',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: TColors.white,
  );
}
