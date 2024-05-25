import 'package:flutter/material.dart';
import 'package:instagram/util/bubble_stories.dart';
import 'package:instagram/util/my_grid_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // PROFILE PICTURE
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    // POSTS, FOLLOWERS AND FOLLOWING
                    Column(
                      children: [
                        Text(
                          '90',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Posts'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '500k',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Followers'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '100',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Following'),
                      ],
                    )
                  ],
                ),
              ),

              // BIO
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'JESSEDANCR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text('Dance Artiste'),
                    Text('Writer'),
                    Text('Flutter Developer'),
                  ],
                ),
              ),

              // EDIT BIO AND SHARE BIO BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text('Edit profile'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text('Share profile'),
                  ),
                ],
              ),

              // STORY HIGHLIGHTS
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    BubbleStories(userName: 'LA'),
                    BubbleStories(userName: 'RedBull DYS'),
                    BubbleStories(userName: 'Beat N Feet'),
                    BubbleStories(userName: 'Burna'),
                  ],
                ),
              ),

              // TABS
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_4x4_sharp),
                  ),
                  Tab(
                    icon: Icon(Icons.slow_motion_video_rounded),
                  ),
                  Tab(
                    icon: Icon(Icons.person_pin_rounded),
                  )
                ],
              ),
              Expanded(
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
    );
  }
}
