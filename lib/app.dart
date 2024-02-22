import 'package:flutter/material.dart';
import 'package:golden_circle/navigation_menu.dart';
import 'package:golden_circle/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.theme,
      home: const NavigationMenu(),
    );
  }
}
