// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  MyBottomSheet({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: TextField(
              controller: controller,
              cursorColor: Colors.black,
              cursorWidth: 1.5,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // Save and cancel buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0.0),
                ),
                onPressed: onSave,
                child: Text('Save'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0.0),
                  ),
                  onPressed: onCancel,
                  child: Text('Cancel'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
