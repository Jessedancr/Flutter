import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onTap;
  const MyFloatingActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      elevation: 0.0,
      backgroundColor: Colors.black,
      child: Image.asset(
        'images/add.png',
        height: 24,
      ),
    );
  }
}
