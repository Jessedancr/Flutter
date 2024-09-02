import 'package:flutter/material.dart';
import 'package:twitterclone/screens/login_screen.dart';
import 'package:twitterclone/screens/sign_up_screen.dart';

/**
 * THIS FILE DETERMINES WHETHER TO SHOW THE LOGIN OR REGISTER PAGE
 */

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Show login page initially
  bool showLoginScreen = true;

  // Func to switch btw the two
  void toggleScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(
        onPressed: toggleScreen,
      );
    } else {
      return SignUpScreen(
        onPressed: toggleScreen,
      );
    }
  }
}
