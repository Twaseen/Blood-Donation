import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:final_app/1stpage.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), (){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // Your Image
            Image.asset(
              'assets/images/splash_2.png',
            width: 150.0,
            height: 150.0,
          ),
          Text(
            'Blood Bank Management',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.red[600],
            ),
          ),
          ],
        ),
      ),
      ),
    );
  }
}
