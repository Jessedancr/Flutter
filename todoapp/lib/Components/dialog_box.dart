import 'package:flutter/material.dart';
import 'package:todoapp/Components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black54,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Textfield to get user input
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Add a new task",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.grey[800]),
            ),

            // Save and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                MyButton(
                  onPressed: onSave,
                  text: 'Save',
                ),

                SizedBox(
                  width: 7.0,
                ),
                // Cancel button
                MyButton(
                  onPressed: onCancel,
                  text: 'Cancel',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
