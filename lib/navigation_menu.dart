import 'package:flutter/material.dart';
import 'package:golden_circle/features/location/screens/explore/explore.dart';
import 'package:golden_circle/features/location/screens/search/search.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:golden_circle/utils/constants/icon_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:golden_circle/features/location/screens/profile/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: TColors.borderPrimary2, width: 2.0),
            ),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.selected)
                          ? const TextStyle(
                              color: TColors.primary,
                              fontWeight: FontWeight.w600)
                          : const TextStyle(
                              color: TColors.secondary,
                              fontWeight: FontWeight.w600)),
            ),
            child: NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,
              destinations: [
                NavigationDestination(
                    icon: Iconify(TIcons.svgExplore,
                        size: 27,
                        color: controller.selectedIndex.value == 0
                            ? TColors.primary
                            : TColors.secondary),
                    label: 'Explore'),
                NavigationDestination(
                    icon: Iconify(TIcons.svgEvents,
                        size: 27,
                        color: controller.selectedIndex.value == 1
                            ? TColors.primary
                            : TColors.secondary),
                    label: 'Events'),
                NavigationDestination(
                  icon: Iconify(TIcons.svgProfile,
                      size: 27,
                      color: controller.selectedIndex.value == 2
                          ? TColors.primary
                          : TColors.secondary),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const ExploreScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
}
