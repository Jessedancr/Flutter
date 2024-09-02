import 'package:flutter/material.dart';

/**
 * A SIMPLE ELEVATED BUTTON
 */
class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
