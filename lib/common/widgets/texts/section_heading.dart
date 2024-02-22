import 'package:flutter/material.dart';
import 'package:jazz/utils/constants/colors.dart';
import 'package:jazz/utils/constants/texts_style.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading(
      {super.key,
      this.onPressed,
      this.textColor,
      this.buttonTitle = 'View all',
      required this.title,
      this.showActionButton = false});

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TTextStyle.headlineXSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(buttonTitle,
                style: const TextStyle(
                    color: TColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
      ],
    );
  }
}
