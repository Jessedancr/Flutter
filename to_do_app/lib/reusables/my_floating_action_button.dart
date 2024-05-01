import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onTap;
  const MyFloatingActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      elevation: 0.0,
      backgroundColor: Colors.grey[800],
    );
  }
}
