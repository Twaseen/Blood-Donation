import 'package:final_app/signup.dart';
import 'package:final_app/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_app/authentication_repository.dart';
import 'package:final_app/splash_screen.dart';
import 'package:final_app/user_repository.dart';
import 'package:final_app/user_model.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    final user = UserModel(
        FullName: controller.FullName.text.trim(),
        BloodGroup: controller.BloodGroup.text.trim(),
        ContactNumber: controller.ContactNumber.text.trim(),
        Age: controller.Age.text.trim(),
        Email: controller.Email.text.trim(),
        Password: controller.Password.text.trim()
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Blood Bank Registration'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
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
                  'Create a new account',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: controller.FullName,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: controller.BloodGroup,
                decoration: InputDecoration(
                  icon: Icon(Icons.local_hospital),
                  labelText: 'Blood Group',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: controller.ContactNumber,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'Contact Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: controller.Age,
                decoration: InputDecoration(
                  icon: Icon(Icons.event),
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: controller.Email,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                obscureText: false,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: controller.Password,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Implement registration logic
                  if(_formKey.currentState!.validate()) {
                   SignUpController.instance.createUser(user);
                   Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) =>SignUpScreen()),
                  }
                },
                child: Text('Register'),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                  // Navigate to login screen
                },
                child: Text('Already have an account? Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
