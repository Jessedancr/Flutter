import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/logic/task_provider.dart';

import 'index_page.dart';

void main() async {
  // Initialize the hive
  await Hive.initFlutter();

  // Open a box
  await Hive.openBox('myBox');

  // Running the app
  runApp(
    // Wrapping the entire app in multiprovider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return TaskProvider();
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
