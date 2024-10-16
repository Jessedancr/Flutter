import 'package:flutter/material.dart';

class MyBioBox extends StatelessWidget {
  final String bioText;
  const MyBioBox({
    super.key,
    required this.bioText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(20),
        child: Text(
          bioText.isNotEmpty ? bioText : 'Empty bio',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
