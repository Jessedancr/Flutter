import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/**
 * AUTHENTICATION SERVICE
 * 
 * This file handle everything relating to firebase authentication
 * 
 * Sign up
 * Login
 * Logout
 */

class AuthService {
  // get instance of current auth status
  final _auth = FirebaseAuth.instance;

  /**
   * GET THE CURRENT USER AND THEIR ID
   * 
   * Returns:
   *   User? - The current user, or null if no user is signed in.
   *   String - The current user's ID, or an empty string if no user is signed in.
   */
  User? getCurrentUser() => _auth.currentUser;
  String getCurrentUid() => _auth.currentUser!.uid;

  /**
   * LOG IN WITH EMAIL AND PASSWORD
   * 
   * Parameters:
   *   email (String) - The email address to log in with.
   *   password (String) - The password to log in with.
   * 
   * Returns:
   *   Future<UserCredential> - A future that completes with the user's credentials if the login is successful.
   * 
   * Throws:
   *   Exception - If the login fails, with the error code as the exception message.
   */
  Future<UserCredential> loginWithEmailPassword(String email, password) async {
    // Attempt login
    try {
      final userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCred;
    }
    // Catch errors
    on FirebaseAuthException catch (e) {
      debugPrint('Error logging in: $e');
      throw Exception(e.code);
    }
  }

  /**
   * SIGN UP WITH EMAIL AND PASSWORD
   * 
   * Parameters:
   *   email (String) - The email address to sign up with.
   *   password (String) - The password to sign up with.
   * 
   * Returns:
   *   Future<UserCredential> - A future that completes with the user's credentials if the sign up is successful.
   * 
   * Throws:
   *   Exception - If the sign up fails, with the error code as the exception message.
   */
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCred;
    } on FirebaseAuthException catch (e) {
      debugPrint('Error signing up $e');
      throw Exception(e.code);
    }
  }

  /**
   * LOG OUT THE CURRENT USER
   * 
   * Returns:
   *   Future<void> - A future that completes when the logout is successful.
   */
  Future<void> logout() async {
    await _auth.signOut();
  }
}
