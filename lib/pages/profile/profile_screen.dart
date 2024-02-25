import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_circle/pages/profile/UpdateProfileScreen.dart';
import 'package:golden_circle/pages/profile/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar of the  profile screen, which includes only 1 word that is Account. Also position
      /// of it could be manipulated as desired.
      ///Body of the profile screen which would include the list of features, notifications, help and support, etc,
      ///But since its is only the prottypoe of our app, some of these features dont work, and they are here to
      ///give you an idea on what we will be doing.
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/1.png'),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: const Icon(Icons.edit,
                            size: 18.0, color: Colors.black)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Victor Lam',
                style:TextStyle(color: Color(0xFF6B555A)),
              ),
              const Text(
                'victorlam8@gmail.com',
                style:TextStyle(color: Color(0xFF6B555A)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color:  Color(0xFF333333),
                    ),
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
