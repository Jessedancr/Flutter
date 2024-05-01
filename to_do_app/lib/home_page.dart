import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

// OTHER IMPORTS
import 'package:to_do_app/screens/completed_tasks.dart';
import 'package:to_do_app/screens/new_task.dart';
import 'package:to_do_app/screens/scheduled_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  // LIST OF PAGES/SCREENS FOR BOTTOM BAR
  final List screens = [
    ScheduledTasks(),
    NewTask(),
    CompletedTasks(),
  ];

  // METHOD TO NAVIGATE BOTTOM BAR
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TO DO APP',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 22.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.grey.shade800,
        animationDuration: Duration(milliseconds: 350),
        height: 55,
        index: selectedIndex,
        onTap: navigateBottomBar,
        items: [
          Icon(Icons.calendar_month),
          Icon(Icons.home_filled),
          Icon(Icons.access_time),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
