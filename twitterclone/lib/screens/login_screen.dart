import 'package:flutter/material.dart';
import 'package:twitterclone/services/auth/auth_service.dart';
import 'package:twitterclone/widgets/my_form_button.dart';
import 'package:twitterclone/widgets/my_loading_circle.dart';

import '../widgets/my_text_field.dart';

/**
 * LOGIN SCREEN
 * 
 * User would log in with email and password
 * on login, user would be redirected to homescreen
 * If user doesn't have an acct, he can go to the sign up
 * screen from here
 */
class LoginScreen extends StatefulWidget {
  final void Function()? onPressed;
  const LoginScreen({
    super.key,
    required this.onPressed,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Access auth service
  final _auth = AuthService(); // Instance of AuthService class

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // LOGIN
  void login() async {
    // Show loading indicator
    showLoadingCircle(context);

    try {
      await _auth.loginWithEmailPassword(
          emailController.text, passwordController.text);

      // Hide loading circle after successfull login
      if (mounted) hideLoadingCircle(context);
    } catch (e) {
      // Hide loading circle after failed login
      // and display snackbar with error message
      if (mounted) {
        hideLoadingCircle(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
      debugPrint('Error logging in $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Logo
                  Icon(
                    Icons.lock_open_outlined,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 20),

                  // Welcome back message
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),

                  // Email textfield
                  MyTextField(
                    hintText: 'Email',
                    obscureText: false,
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),

                  // Password textfield
                  MyTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),

                  // Forgot password?
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Sign in button
                  MyFormButton(
                    onTap: login,
                    text: 'Login',
                  ),
                  const SizedBox(height: 15),

                  // Not a member? sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member? ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextButton(
                        // The keyword 'widget' is used to access props of this class's parent
                        onPressed: widget.onPressed,
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
