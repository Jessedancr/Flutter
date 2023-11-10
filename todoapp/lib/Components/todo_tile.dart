import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            // checkbox
            Checkbox(
              value: taskDone,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),

            // task name
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
