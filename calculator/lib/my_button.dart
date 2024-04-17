import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final buttonColor;
  final textColor;
  final buttonTapped;
  // Costructor
  const MyButton({
    required this.buttonColor,
    required this.buttonText,
    required this.textColor,
    required this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
            ),
          ),
        ),
      ),
    );
  }
}
