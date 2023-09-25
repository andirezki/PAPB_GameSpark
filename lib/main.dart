import 'package:flutter/material.dart';
import 'package:gamespark/screens/login_screen.dart';
import 'package:gamespark/screens/signup_screen.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Sign Up'),
          ),
          body: SignUp()),
    );
  }
}
