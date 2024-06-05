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

  // Creating intance of NewTaskState to call the deleteAll function
  NewTaskState newTask = NewTaskState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                color: Colors.grey[400],
                fontSize: 16.0,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/search.png', height: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: newTask.deleteAll,
                    icon: Image.asset('images/delete.png', height: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 350),
        height: 55,
        index: selectedIndex,
        onTap: navigateBottomBar,
        items: [
          Image.asset('images/scheduled_tasks.png', height: 30, width: 30),
          Image.asset('images/home.png', height: 35, width: 35),
          Image.asset('images/completed_tasks.png', height: 35, width: 35),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
