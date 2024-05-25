import 'package:flutter/material.dart';

class BubbleStories extends StatelessWidget {
  final String userName;
  const BubbleStories({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(userName)
        ],
      ),
    );
  }
}
