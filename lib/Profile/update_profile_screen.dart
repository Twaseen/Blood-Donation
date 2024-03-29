import 'package:final_app/profile_controller.dart';
import 'package:final_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widgets/profile_menu.dart';
import 'package:get/get.dart';
import 'package:final_app/signup_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.smart_button),
        ),
        title: Text("EditProfile", style: TextStyle(fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;
                  UserModel userData = snapshot.data as UserModel;

                  final FullName = TextEditingController(text: user.FullName) ;
                  final BloodGroup = TextEditingController(text: user.BloodGroup) ;
                  final ContactNumber = TextEditingController(text: user.ContactNumber) ;
                  final Age = TextEditingController(text: user.Age) ;
                  final Email = TextEditingController(text: user.Email) ;
                  final Password = TextEditingController(text: user.Password) ;

                  return Column(
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
                                Icons.camera,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller:FullName,
                              decoration: const InputDecoration(
                                labelText: "FullName",
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(height: 40 - 20),
                            TextFormField(
                              controller: BloodGroup,
                              decoration: const InputDecoration(
                                labelText: "Blood Group",
                                prefixIcon: Icon(Icons.local_hospital),
                              ),
                            ),
                            const SizedBox(height: 40 - 20),
                            TextFormField(
                              controller:ContactNumber,
                              decoration: const InputDecoration(
                                labelText: "Phone Number",
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(height: 40 - 20),
                            TextFormField(
                              controller: Age,
                              decoration: const InputDecoration(
                                labelText: "Age",
                                prefixIcon: Icon(Icons.event),
                              ),
                            ),
                            const SizedBox(height: 40 - 20),
                            TextFormField(
                              controller: Email,
                              decoration: const InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.mail),
                              ),
                            ),
                            const SizedBox(height: 40 - 20),
                            TextFormField(
                              controller: Password,
                              decoration: const InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async{
                                  final userData = UserModel(
                                    FullName: FullName.text.trim(),
                                    BloodGroup: BloodGroup.text.trim(),
                                    ContactNumber: ContactNumber.text.trim(),
                                    Age: Age.text.trim(),
                                    Email: Email.text.trim(),
                                    Password: Password.text.trim(),
                                  );

                                  await controller.updateRecord(user);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  "Edit Profile",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "Joined",
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                        text: "JoinedAt",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
