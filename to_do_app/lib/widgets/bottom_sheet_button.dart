import 'dart:ui';

import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const BottomSheetButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SizedBox(
          width: 70,
          height: 31,
          child: Stack(
            children: [
              // Blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              ),

              // Gradient effect
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red.withOpacity(0.5),
                      Colors.purple.withOpacity(0.7),
                      Colors.blue.shade900.withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              // CHILD
              Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
