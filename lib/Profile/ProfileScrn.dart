import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dashboard.dart';
import 'Widgets/profile_menu.dart';
import 'package:final_app/Profile/update_profile_screen.dart';
import 'package:final_app/splash_screen.dart';
import 'package:final_app/1stpage.dart';
import 'package:final_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );},
          icon: const Icon(Icons.chevron_left_sharp),

        ),
        title: Text(
          "Profile",
          // Use default text style
        ),

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
                      child: Image.asset("assets/facebook_logo.png"), // Replace "assets/image1.jpg" with the actual path
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

              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                  );},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
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
                title: "Full name",
                icon: Icons.person_add,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Age",
                icon: Icons.perm_identity_sharp,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Mobile",
                icon: Icons.phone_android,
                onPress: () {},
              ),

              ProfileMenuWidget(
                title: "Blood Group",
                icon: Icons.bloodtype,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Address',
                icon: Icons.home,
                onPress: () {},
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "LogOut",
                icon: Icons.logout,
                textColor: Colors.pink,
                endIcon: false,
                onPress: () {                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>LandingPage()),

                );},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
