import 'package:final_app/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BloodBankApp());
}

class BloodBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignInScreen extends StatelessWidget {
  String? _selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Blood Bank Registration'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Create a new account',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.local_hospital),
                labelText: 'Blood Group',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.event),
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 15.0),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),

            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Implement registration logic
                // Use _selectedAccountType to get the chosen account type
              },
              child: Text('Register'),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                // Navigate to login screen
              },
              child: Text('Already have an account? Login'),
            )
          ],
        ),
      ),
    );
  }
}