import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/screens/home_page.dart';
import 'package:twitterclone/services/auth/login_or_register.dart';

/**
 * AUTH STATUS
 * 
 * This file is to check if the user is currently logged in
 * This will render the `HomePage` if the user is logged in, or the `LoginOrRegister` page if they are not.
 * 
 * The FirebaseAuth.instance.authStateChanges() stream emits events when the user
 * authentication state changes (when they log in or out)
 * 
 * The builder function is called whenever the stream emits a new event.
 * The snapshot object contains latest data from the stream
 */

class AuthStatus extends StatelessWidget {
  const AuthStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
