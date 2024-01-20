import 'package:final_app/Profile/update_profile_screen.dart';
import 'package:final_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:final_app/splash_screen.dart';
import 'package:get/get.dart';
//import '1stpage.dart';
import 'Widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    //var alternate_sign_out;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left_sharp),
        ),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isDark ? Icons.sunny : Icons.nightlight,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/profile.jpg"), // Replace "assets/image1.jpg" with the actual path
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow,
                      ),
                      child: const Icon(
                        Icons.border_color_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "ProfileHeading",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "ProfileSubHeading",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    side: BorderSide(color: Colors.black),
                  ),
                  child: const Text('Update Profile'),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              // MENU
              ProfileMenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "User name",
                icon: Icons.person,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Mobile",
                icon: Icons.phone_android,
                onPress: () {},
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Blood Group",
                icon: Icons.bloodtype,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "LogOut",
                icon: Icons.logout,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}