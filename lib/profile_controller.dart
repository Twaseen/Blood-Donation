import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_app/authentication_repository.dart';
import 'package:final_app/user_model.dart';
import 'package:final_app/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_app/Profile/ProfileScrn.dart';
import 'package:final_app/Profile/update_profile_screen.dart';
import 'package:final_app/1stpage.dart';
import 'package:final_app/dashboard.dart';
import 'package:final_app/firebase_options.dart';
import 'package:final_app/main.dart';
import 'package:final_app/regpage.dart';
import 'package:final_app/signup.dart';
import 'package:final_app/signup_controller.dart';
import 'package:final_app/signupfaillure.dart';
import 'package:final_app/splash_screen.dart';
import 'package:final_app/user_model.dart';
import 'package:final_app/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final String email = _authRepo.firebaseUser.value.email;

    if(email != null){
      return _userRepo.getUserDetails(email);
    }
    else {
      Get.snackbar("Error", "Login to continue");
    }
  }

}