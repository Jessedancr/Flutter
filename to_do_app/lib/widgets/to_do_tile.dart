// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10.0),
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade700,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.width * 0.89,
            child: Stack(
              children: [
                // Blur effect
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(),
                ),

                // Gradient effect
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        // Check box
                        Checkbox(
                          value: taskDone,
                          onChanged: onChanged,
                          activeColor: Colors.black,
                        ),
                        // Task name
                        Expanded(
                          child: Text(
                            taskName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                              decoration: taskDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'T I M E S T A M P',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
