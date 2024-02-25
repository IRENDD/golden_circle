import 'package:flutter/material.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/sizes.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? icon;
  final VoidCallback? onTapIcon;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.maxLines,
    this.icon,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: TColors.buttonSecondary,
        hintText: hintText,
        hintStyle: TTextStyle.bodySubtitle2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TColors.borderPrimary3, width: 2.0),
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: TColors.secondary.withOpacity(0.7), width: 2.0),
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
        ),
        suffixIcon: icon != null
            ? IconButton(
                icon: Iconify(icon!,
                    size: 22, color: TColors.secondary.withOpacity(0.7)),
                onPressed: onTapIcon,
              )
            : null,
      ),
    );
  }
}
