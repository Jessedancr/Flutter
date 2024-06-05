import 'dart:ui';

import 'package:flutter/material.dart';

class BubbleStories extends StatelessWidget {
  final String userName;
  const BubbleStories({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Container(
              width: 60,
              height: 60,
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
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.7),
                          Colors.grey.withOpacity(0.5),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(userName)
        ],
      ),
    );
  }
}
