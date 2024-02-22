import 'package:flutter/material.dart';
import 'package:jazz/utils/constants/colors.dart';
import 'package:jazz/utils/constants/icon_svg.dart';
import 'package:jazz/utils/constants/sizes.dart';
import 'package:jazz/utils/device/device_utility.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class TSeachContainer extends StatelessWidget {
  const TSeachContainer({
    super.key,
    required this.text,
    this.icon = TIcons.svgSearch,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.md),
  });

  final String text;
  final String icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: TDeviceUtils.getScreenWidth(context) - (padding.horizontal * 3),
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md, vertical: TSizes.smm),
        decoration: BoxDecoration(
          color: showBackground ? TColors.buttonPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd2),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Iconify(icon, color: TColors.textGrey, size: 26),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.textGrey)),
              ],
            ),
            const Iconify(TIcons.svgMicrophone,
                color: TColors.textGrey, size: 27)
          ],
        ),
      ),
    );
  }
}
