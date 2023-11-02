import 'package:flutter/material.dart';

import 'frostedglass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/image.jpg"), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: FrostedGlass(
          theWidth: 200,
          theHeight: 200,
          theChild: Text("FROSTED GLASS EXAMPLE", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
