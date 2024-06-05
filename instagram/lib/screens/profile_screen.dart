import 'package:flutter/material.dart';
import 'package:instagram/util/bubble_stories.dart';
import 'package:instagram/util/my_grid_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // PROFILE PICTURE
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 16.0),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // POSTS, FOLLOWERS, FOLLOWING
                    Column(
                      children: [
                        Text(
                          '100',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text('Posts'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '500k',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text('Followers'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '80',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text('Following'),
                      ],
                    ),
                  ],
                ),

                // BIO
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'JESSEDANCR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text('Dance Artiste'),
                      Text('Writer'),
                      Text('Flutter Dev'),
                    ],
                  ),
                ),

                // EDIT BIO AND SHARE BIO BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Center(child: Text('Edit Profile')),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Center(child: Text('Share Profile')),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ],
                ),

                // STORY HIGHLIGHTS
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BubbleStories(userName: 'Redbull DYS'),
                        BubbleStories(userName: 'Beat N Feet'),
                        BubbleStories(userName: 'Rennaisance tour'),
                        BubbleStories(userName: 'Rema'),
                      ],
                    ),
                  ),
                ),

                // TABS
                TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  labelColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_4x4),
                    ),
                    Tab(
                      icon: Icon(Icons.slow_motion_video_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.person_pin_circle_rounded),
                    ),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TabBarView(
                    children: [
                      MyGridView(),
                      MyGridView(),
                      MyGridView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
