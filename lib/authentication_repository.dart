import 'package:final_app/firebase_options.dart';
import 'package:final_app/signupfaillure.dart';
import 'package:final_app/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_app/regpage.dart';
import 'package:final_app/signup_controller.dart';
import 'package:final_app/1stpage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => LandingPage()): Get.offAll(() => SplashScreen());
  }

  Future<void> phoneAuthentication(String ContactNumber) async{
    _auth.verifyPhoneNumber(
        verificationCompleted: (credentials) {

        },
        verificationFailed: (e){},
        codeSent: (verificationID, resendToken){},
        codeAutoRetrievalTimeout: (verificationID){},
    );
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
    } catch (_){}
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value !=null ? Get.offAll(()=> SplashScreen()): Get.to(() => LandingPage());
    } on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION -${ex.message}');
      throw ex;
    } catch (_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }
}