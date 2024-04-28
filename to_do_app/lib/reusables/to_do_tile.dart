// ignore_for_file: must_be_immutable

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
      padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10.0),
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.deepPurple,
          ),
          child: Row(
            children: [
              // Check box
              Checkbox(
                value: taskDone,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // Task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
