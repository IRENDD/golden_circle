import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/sizes.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';

// CustomTextField widget
class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onSuffixIconPressed;
  final int? maxLines;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSuffixIconPressed,
    this.maxLines = 1,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
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
        prefixIcon: prefixIcon != null
            ? Iconify(prefixIcon!, color: TColors.secondary.withOpacity(0.7))
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Iconify(suffixIcon!,
                    size: 22, color: TColors.secondary.withOpacity(0.7)),
                onPressed: onSuffixIconPressed,
              )
            : null,
      ),
    );
  }
}
