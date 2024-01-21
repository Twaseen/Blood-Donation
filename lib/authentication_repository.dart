import 'package:final_app/firebase_options.dart';
import 'package:final_app/signupfaillure.dart';
import 'package:final_app/splash_screen.dart';
import 'package:final_app/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_app/regpage.dart';
import 'package:final_app/signup_controller.dart';
import 'package:final_app/1stpage.dart';
import 'package:final_app/user_repository.dart';
import 'signup_controller.dart';
import 'package:final_app/dashboard.dart';



class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User> firebaseUser;

  // AuthenticationRepository() {
  //   firebaseUser.bindStream(_auth.userChanges());
  //   ever(firebaseUser, _setInitialScreen);
  // }

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser) ;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => LandingPage()): Get.offAll(() => Dashboard());
  }

  // Future<void> phoneAuthentication(String ContactNumber) async{
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: ContactNumber,
  //       verificationCompleted: (credential) async{
  //         await _auth.signInWithCredential(credential);
  //       },
  //       codeSent: (verificationID, resendToken) {
  //         this.verificationId.value =verificationID;
  //       },
  //       codeAutoRetrievalTimeout: (verificationID){
  //         this.verificationId.value =verificationID;
  //       },
  //     verificationFailed: (e){
  //       if (e.code == 'invalid-phone-number'){
  //         Get.snackbar('Error', 'The provided phone number is not valid.');
  //       }
  //       else {
  //         Get.snackbar('Error', 'Something went wrong. Try again.');
  //       }
  //     },
  //   );
  // }

  // Future<bool> verifyOTP (String OTP) async{
  //  var credential =await _auth.signInWithCredential(
  //    PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: OTP)
  //  );
  //  return credential.user != null? true :false;
  // }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value !=null ? Get.offAll(()=> Dashboard()): Get.to(() => LandingPage());
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

  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
    } catch (_){

    }
  }

  Future<void> logout() async => await _auth.signOut();
}


