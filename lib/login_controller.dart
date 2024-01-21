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
import 'package:final_app/signup_controller.dart';
import 'package:final_app/signupfaillure.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();
  final Email = TextEditingController();
  final Password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> signInUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future<void> signIn() async {
    try {
      await signInUser(Email.text.trim(), Password.text.trim());
      Get.off(() => Dashboard());
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: 'Sign-in failed: $error'));
    }
  }
}
