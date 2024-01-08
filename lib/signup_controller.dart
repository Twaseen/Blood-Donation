import 'package:final_app/authentication_repository.dart';
import 'package:final_app/firebase_options.dart';
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

  void registerUser(String email,String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}