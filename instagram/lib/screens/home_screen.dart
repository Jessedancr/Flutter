import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/util/user_posts.dart';

import '../util/bubble_stories.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List users = [
    ['Jessedancr', 'Beat N Feet 4.0!!'],
    ['t3ssio', 'Music..my medicine'],
    ['theghostcreative', 'Do not underestimate the power of my pen'],
    ['thecopywiz', ''],
    ['lestwinson', 'Rennaisance world tour you ready?!'],
    ['lestwinsoff', 'Always...'],
    ['seanLew', "The artiste's mindset part 1"],
    ['heisrema', 'I and broski cooking up somn for yall'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Instagram',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontFamily: 'Lobster',
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/heart_red.png', height: 24),
                ),
                Image.asset('images/dm_red.png', height: 22)
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // USER STORIES
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return BubbleStories(
                  userName: users[index][0],
                );
              },
            ),
          ),

          // USER POSTS
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserPosts(
                  userName: users[index][0],
                  caption: users[index][1],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
