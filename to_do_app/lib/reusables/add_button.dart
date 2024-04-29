import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function()? onTap;
  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: Colors.grey),
      ),
    );
  }
}
