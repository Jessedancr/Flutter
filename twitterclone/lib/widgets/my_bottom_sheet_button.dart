import 'package:flutter/material.dart';

class MyBottomSheetButton extends StatelessWidget {
  void Function()? onTap;
  final String buttonText;
  MyBottomSheetButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}
