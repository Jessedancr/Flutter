import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';

import 'package:to_do_app/reusables/to_do_tile.dart';

import '../my_bottom_sheet.dart';

import 'package:to_do_app/reusables/my_floating_action_button.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => NewTaskState();
}

class NewTaskState extends State<NewTask> {
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();

  // Instantiation of DB class
  ToDoDataBase db = ToDoDataBase();

  // INIT STATE METHOD
  @override
  void initState() {
    super.initState();
    // If this is the first tine opening the app
    if (_myBox.get("ToDoItem") == null) {
      db.initialData();
    } else {
      db.loadData(); // There's already data in the DB
    }
  }

  // FUNCTION TO CHECK THE CHECKBOX
  void checkBoxChanged(bool value, int index) {
    setState(() {
      db.toDoItems[index][1] = !db.toDoItems[index][1];
    });
    db.updateData();
  }

  // FUNCTION TO SAVE NEW TASK
  void saveNewTask() {
    setState(() {
      db.toDoItems.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updateData();
  }

  // FUNCTION TO DELETE TASK
  void deleteTask(index) {
    setState(() {
      db.toDoItems.removeAt(index);
    });
    db.updateData();
  }

  // METHOD TO DELETE ALL TASKS
  void deleteAll() {
    setState(() {
      db.toDoItems.clear();
    });
    db.updateData();
  }

  // FUNCTION TO ADD NEW TASK
  void createNewTask() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(15.0),
            topEnd: Radius.circular(15.0),
          ),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: MyBottomSheet(
              onSave: saveNewTask,
              controller: _controller,
            ),
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
            itemCount: db.toDoItems.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoItems[index][0],
                taskDone: db.toDoItems[index][1],
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
