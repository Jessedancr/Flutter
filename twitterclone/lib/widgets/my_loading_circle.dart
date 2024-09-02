import 'package:flutter/material.dart';

/**
 * SHOW LOADING CIRCLE
 */

// Show loading circle
void showLoadingCircle(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        content: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}

// Hide loading circle
void hideLoadingCircle(BuildContext context) {
  Navigator.of(context).pop();
}
