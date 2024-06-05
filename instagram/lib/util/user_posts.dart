import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/util/glass_box.dart';

import 'profile_pic_glass_box.dart';

class UserPosts extends StatelessWidget {
  final String userName;
  final String caption;
  const UserPosts({super.key, required this.userName, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GlassBox(),

            // PROFILE PICTURE
            Positioned(
              left: 12.0,
              top: 30.0,
              child: ProfilePicGlassBox()
            ),

            // USER NAME
            Positioned(
              left: 70.0,
              top: 38.0,
              child: Text(userName),
            ),

            // ICON
            Positioned(
              right: 10,
              top: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),

        // LIKE COMMENT AND SHARE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset('images/heart_red.png', height: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset('images/chat_red.png', height: 23),
                ),
                Image.asset('images/send_red.png', height: 24),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/bookmark_red.png', height: 24),
            ),
          ],
        ),

        // LIKED BY...
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text('Liked by '),
              Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(' and '),
              Text(
                'others',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),

        // CAPTION
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 10.0),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' $caption',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
