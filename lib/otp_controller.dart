// import 'package:final_app/authentication_repository.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:final_app/splash_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class OTPController extends GetxController {
//   static OTPController get instance => Get.find();
//
//   void verifyOTP(String OTP) async {
//     var isVerified = await AuthenticationRepository.instance.verifyOTP(OTP);
//     isVerified ? Get.offAll( SplashScreen()) :Get.back();
//   }
// }