import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final buttonColor;
  final textColor;
  final buttonTapped;
  final splashColor;
  // Costructor
  const MyButton({
    required this.buttonColor,
    required this.buttonText,
    required this.textColor,
    required this.buttonTapped, 
    required this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle
      ),
      child: InkWell(
        splashFactory: InkSparkle.splashFactory,      
        customBorder: CircleBorder(),
        splashColor: splashColor,
        onTap: buttonTapped,
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
