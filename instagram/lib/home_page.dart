// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:instagram/screens/explore_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/new_post_screen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/reels_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // LIST OF SCREENS TO NAVIGATE TO
  final List screens = [
    HomeScreen(),
    ExploreScreen(),
    NewPostScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  void navigateBottomBar(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: GNav(
            gap: 4.0,
            backgroundColor: Colors.black,
            activeColor: Colors.white,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade600,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            padding: EdgeInsets.all(8.5),
            selectedIndex: selectedIndex,
            onTabChange: navigateBottomBar,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.add,
                text: 'New post',
              ),
              GButton(
                icon: Icons.slow_motion_video_rounded,
                text: 'Reels',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
