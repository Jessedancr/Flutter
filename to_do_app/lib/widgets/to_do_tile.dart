// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/logic/task_provider.dart';

class ToDoTile extends StatelessWidget {
  final int loadingStateIndex; // index to access loading state
  final String? dateTime;
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
    this.dateTime,
    required this.loadingStateIndex,
  });

  @override
  Widget build(BuildContext context) {
    // This is used to check if the current task is still loading its' dateTime
    // by looking up its' loading state in TaskProvider
    final bool isLoading =
        context.watch<TaskProvider>().isLoading(loadingStateIndex);

    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
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
            height: MediaQuery.of(context).size.height * 0.13,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isLoading
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                              ),
                            )
                          : Text(
                              dateTime != null
                                  ? '$dateTime'
                                  : 'Error fetching time',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
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
