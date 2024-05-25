import 'package:flutter/material.dart';
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
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Instagram',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                ),
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
