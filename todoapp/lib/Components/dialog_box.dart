import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black54,
      content: Container(
        height: 120,
        child: Column(
          children: [
            // Textfield to get user input
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Input a new task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            // Save and cancel buttons
          ],
        ),
      ),
    );
  }
}
