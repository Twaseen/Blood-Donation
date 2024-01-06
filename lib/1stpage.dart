import 'package:final_app/regpage.dart';
import 'package:final_app/signup.dart';
import 'package:flutter/material.dart';




class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank'),
        backgroundColor: Colors.red[400],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
      // Background Image
      Positioned.fill(
      child: Image.asset(
        'assets/images/background_image.jpg',
        fit: BoxFit.cover,
      ),
    ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text('Sign Up', style:TextStyle(color: Colors.red[600],),),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Sign In', style:TextStyle(color: Colors.red[500],)),

            ),
          ],
        ),
      ),
    ]),);
  }
}