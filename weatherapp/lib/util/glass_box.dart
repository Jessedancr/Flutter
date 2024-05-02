// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final height;
  final width;

  final BorderRadiusGeometry borderRadius;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final Widget child;
  GlassBox({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.leftPadding,
    required this.rightPadding,
    required this.topPadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
        top: topPadding,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              // BLUR EFFECT
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Container(),
              ),

              // GRADIENT EFFECT
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),

              // CHILD
              child
            ],
          ),
        ),
      ),
    );
  }
}
