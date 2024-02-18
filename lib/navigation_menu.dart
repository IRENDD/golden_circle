import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/location/screens/event_details/event_details.dart';
import 'package:flutter_application_1/features/location/screens/events/events.dart';
import 'package:flutter_application_1/features/location/screens/explore/explore.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/icon_svg.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                (Set<MaterialState> states) =>
                    states.contains(MaterialState.selected)
                        ? const TextStyle(
                            color: TColors.primary, fontWeight: FontWeight.w600)
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
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const ExploreScreen(),
    const EventsScreen(),
    Container(color: Colors.orange)
  ];
}
