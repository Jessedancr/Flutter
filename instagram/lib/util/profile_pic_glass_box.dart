import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePicGlassBox extends StatelessWidget {
  const ProfilePicGlassBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Stack(
          children: [
            // BLUR EFFECT
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),

            // GRADIENT EFFECT
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.red.withOpacity(0.7),
                    Colors.orange.withOpacity(0.5),
                    Colors.white.withOpacity(0.3),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
