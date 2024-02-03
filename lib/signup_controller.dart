import 'package:final_app/authentication_repository.dart';
import 'package:final_app/dashboard.dart';
import 'package:final_app/firebase_options.dart';
import 'package:final_app/splash_screen.dart';
import 'package:final_app/user_model.dart';
import 'package:final_app/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_app/regpage.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final FullName = TextEditingController() ;
  final BloodGroup = TextEditingController() ;
  final ContactNumber = TextEditingController() ;
  final Age = TextEditingController() ;
  final Email = TextEditingController() ;
  final Password = TextEditingController() ;

  final userRepo= Get.put(UserRepository());

  Future<void> registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  // void phoneAunthentication(String ContactNumber){
  //   AuthenticationRepository.instance.phoneAuthentication(ContactNumber);
  // }
  //
  Future<void> createUser(UserModel user) async {
    try {
      await userRepo.createUser(user);
      await registerUser(user.Email, user.Password);
      Get.off(() => Dashboard());
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: 'Registration failed: $error'));
    }
  }
}