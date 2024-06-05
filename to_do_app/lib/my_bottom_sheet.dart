// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'dart:ui';
import 'package:flutter/material.dart';
import 'reusables/bottom_sheet_button.dart';
import 'home_page.dart';

var _borderRadius = Radius.circular(15.0);

class MyBottomSheet extends StatelessWidget {
  final controller;
  final onSave;

  MyBottomSheet({
    super.key,
    required this.controller,
    this.onSave,
  });

  var homePage = HomePageState();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.only(
        topStart: _borderRadius,
        topEnd: _borderRadius,
      ),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0,
                sigmaY: 15.0,
              ),
              child: Container(),
            ),
            // Gradient effect
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: _borderRadius,
                  topEnd: _borderRadius,
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.black.withOpacity(0.5)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // Child
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: TextField(
                    controller: controller,
                    cursorColor: Colors.black,
                    cursorWidth: 1.5,
                    decoration: InputDecoration(
                      hintText: 'Add a new task',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                    ),
                  ),
                ),

                // Save and cancel buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SAVE BUTTON
                    GestureDetector(
                      onTap: onSave,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          width: 70,
                          height: 31,
                          child: Stack(
                            children: [
                              // Blur effect
                              BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              ),

                              // Gradient effect
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red.withOpacity(0.5),
                                      Colors.purple.withOpacity(0.7),
                                      Colors.blue.shade900.withOpacity(0.9),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),

                              // CHILD
                              Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // CANCEL BUTTON
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BottomSheetButton(
                        buttonText: 'Cancel',
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
