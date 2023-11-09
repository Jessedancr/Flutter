import 'package:flutter/material.dart';
import 'package:navigation/homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INTRO PAGE"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           Navigator.pushNamed(context, '/homepage');
          },
          child: Text("GO TO HOME PAGE"),
        ),
      ),
    );
  }
}
