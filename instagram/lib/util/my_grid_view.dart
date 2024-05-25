import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      itemCount: 60,
      //padding: EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return Container(
          width: 50,
          height: 50,
          color: Theme.of(context).primaryColor,
        );
      },
    );
  }
}
