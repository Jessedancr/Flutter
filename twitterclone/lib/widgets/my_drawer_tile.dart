import 'package:flutter/material.dart';

/**
 * Simple tile widget for the drawer widget
 * 
 * To use this widget you need
 * Title
 * Leading icon
 * Function
 */
class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  void Function()? onTap;
  MyDrawerTile({
    super.key,
    required this.leadingIcon,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).colorScheme.primary,
      ),
      onTap: onTap,
    );
  }
}
