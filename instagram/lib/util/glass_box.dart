import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  const GlassBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: ClipRRect(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          color: Colors.transparent,
          child: Stack(
            children: [
              // BLUR EFFECT
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(),
              ),

              // GRADIENT EFFECT
              Container(
                decoration: BoxDecoration(
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
    );
  }
}
