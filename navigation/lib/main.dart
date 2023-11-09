import 'package:flutter/material.dart';
import 'package:navigation/homepage.dart';

import 'intropage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: {
        '/homepage':(context) => HomePage(),
        '/intropage':(context) => IntroPage(),
      },
    );
  }
}