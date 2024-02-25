import 'package:flutter/material.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/icon_svg.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    //var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    //var iconColor = isDark ?

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Icon(icon, color: const Color(0xFF6B555A)),
      ),
      title: Text(
        title,
        style: TTextStyle.bodySubtitle,
      ),
      trailing: endIcon
          ? Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: TColors.borderPrimary3,
              ),
              child: Center(
                child: IconButton(
                    icon: Iconify(TIcons.svgArrowRight,
                        color: TColors.secondary, size: 18),
                    iconSize: 20,
                    color: const Color(0xFF6B555A),
                    onPressed: () {}),
              ))
          : null,
    );
  }
}
