import 'package:flutter/material.dart';

class ReelsPic extends StatelessWidget {
  const ReelsPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
