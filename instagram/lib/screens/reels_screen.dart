import 'package:flutter/material.dart';

import 'Reels/Reels1.dart';
import 'Reels/Reels2.dart';
import 'Reels/Reels3.dart';
import 'Reels/Reels4.dart';

class ReelsScreen extends StatelessWidget {
  final controller = PageController(initialPage: 0);
  ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Reels1(),
        Reels2(),
        Reels3(),
        Reels4(),
      ],
    );
  }
}
