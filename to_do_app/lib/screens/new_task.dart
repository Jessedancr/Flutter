import 'package:flutter/material.dart';

import 'package:to_do_app/reusables/to_do_tile.dart';

import '../my_bottom_sheet.dart';

import 'package:to_do_app/reusables/my_floating_action_button.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _controller = TextEditingController();
  // LIST OF TO DO ITEMS
  final List toDoItems = [];

  // FUNCTION TO CHECK THE CHECKBOX
  void checkBoxChanged(bool value, int index) {
    setState(() {
      toDoItems[index][1] = !toDoItems[index][1];
    });
  }

  // FUNCTION TO SAVE NEW TASK
  void saveNewTask() {
    setState(() {
      toDoItems.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  // FUNCTION TO DELETE TASK
  void deleteTask(index) {
    setState(() {
      toDoItems.removeAt(index);
    });
  }

  // FUNCTION TO ADD NEW TASK
  void createNewTask() {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(15.0),
            topEnd: Radius.circular(15.0),
          ),
        ),
        context: context,
        builder: (BuildContext) {
          return MyBottomSheet(
            onSave: saveNewTask,
            controller: _controller,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          ListView.builder(
            itemCount: toDoItems.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDoItems[index][0],
                taskDone: toDoItems[index][1],
                onChanged: (value) => checkBoxChanged(value!, index),
                deleteTask: (context) => deleteTask(index),
              );
            },
          ),
          Positioned(
            bottom: 70,
            right: 20,
            child: MyFloatingActionButton(
              onTap: createNewTask,
            ),
          ),
        ],
      ),
    );
  }
}
