// signin.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_app/authentication_repository.dart';
import 'package:final_app/splash_screen.dart';
import 'package:final_app/user_repository.dart';
import 'package:final_app/user_model.dart';
import 'package:final_app/login_controller.dart'; // Import the SignInController

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    final _formKey = GlobalKey<FormState>();
    // final user = UserModel(
    //   FullName: controller.full,
    //   Email: controller.Email.text.trim(),
    //   Password: controller.Password.text.trim(),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Blood Bank Sign In'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: controller.Email,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: false,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: controller.Password,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async {
                    // Implement sign-in logic
                    if (_formKey.currentState!.validate()) {
                      await LogInController.instance.signIn();
                    }
                  },
                  child: Text('Sign In'),
                ),
                SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
