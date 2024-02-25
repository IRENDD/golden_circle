import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_circle/features/location/screens/profile/UpdateProfileScreen.dart';
import 'package:golden_circle/features/location/screens/profile/profile_menu.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 15),
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color.fromARGB(255, 239, 192, 22),
                    width: 3.5,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/1.png'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Victor Lam',
                style: TTextStyle.mainTitle,
              ),
              Text(
                'victorlam8@gmail.com',
                style: TTextStyle.mainSubtitle,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 239, 192, 22),
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TTextStyle.secondaryButton,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenu(
                  title: "Language Preferences",
                  icon: Icons.language,
                  onPress: () {}),
              ProfileMenu(
                  title: "Events Notifications",
                  icon: Icons.notifications,
                  onPress: () {}),
              ProfileMenu(
                  title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenu(
                  title: "Help & Support", icon: Icons.help, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenu(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
