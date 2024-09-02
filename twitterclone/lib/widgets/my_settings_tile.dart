import 'package:flutter/material.dart';

/**
 * SETTINGS LIST TILE
 * 
 * To use this widget you'll need
 * title
 * action widget
 */
class MySettingsTile extends StatelessWidget {
  final String title;
  final Widget action;
  const MySettingsTile({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          action,
        ],
      ),
    );
  }
}
