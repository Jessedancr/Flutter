// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  //properties
  final theWidth;
  final theHeight;
  final theChild;

  const FrostedGlass(
      {super.key,
      required this.theWidth,
      required this.theHeight,
      required this.theChild});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: theHeight,
        width: theWidth,
        color: Colors.transparent,
        child: Stack(
          children: [
            //blur effect: bottom layer
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),

            //gradient effect: middle layer
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.greenAccent.withOpacity(0.1),
                ],),
              ),
            ),

            // child: top layer
            Center(child: theChild,),
          ],
        ),
      ),
    );
  }
}
