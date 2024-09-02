import 'package:flutter/material.dart';
import 'package:twitterclone/services/auth/auth_service.dart';
import 'package:twitterclone/services/database/database_service.dart';
import 'package:twitterclone/widgets/my_loading_circle.dart';

import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';

/**
 * SIGN UP SCREEN
 * 
 * Here, the user would enter the following:
 * name
 * email
 * password
 * confirm password
 * 
 * Once the user creates an acct he'll be redirected to the home page
 * also you can navigate to the login screen frm here if you have an acct
 */

class SignUpScreen extends StatefulWidget {
  final void Function()? onPressed;
  const SignUpScreen({
    super.key,
    required this.onPressed,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Auth service
  final _auth = AuthService();
  final _db = DatabaseService();

  void userSignUp() async {
    // if passwords match -> create the user
    if (passwordController.text == confirmPasswordController.text) {
      // Show loading circle
      showLoadingCircle(context);
      try {
        await _auth.signUpWithEmailPassword(
            emailController.text, passwordController.text);
        // finished loading
        if (mounted) hideLoadingCircle(context);

        // Store user in db
        await _db.saveUserInfo(email: emailController.text, name: nameController.text);
      } catch (e) {
        if (mounted) hideLoadingCircle(context);

        // let user know of this error
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(e.toString()),
            ),
          );
        }
        debugPrint('$e');
      }
    } else {
      // show error
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("Passwords don't match"),
        ),
      );
    }
  }

  // Text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                  const SizedBox(height: 30),
                  // Logo
                  Icon(
                    Icons.person,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 10),

                  // Welcome back message
                  Text(
                    ' SIGN UP',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),

                  // Name textfield
                  MyTextField(
                    hintText: 'Full name',
                    obscureText: false,
                    controller: nameController,
                  ),
                  const SizedBox(height: 20),

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
                  const SizedBox(height: 20),

                  // Confirm password textfield
                  MyTextField(
                    hintText: 'confirm password',
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),

                  const SizedBox(height: 10),

                  // Sign up button
                  MyButton(
                    onTap: userSignUp,
                    text: 'Sign up',
                  ),
                  const SizedBox(height: 10),

                  // Already have an acct? login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextButton(
                        // The keyword 'widget' is used to access props of this class's parent
                        onPressed: widget.onPressed,
                        child: const Text(
                          'Login',
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
