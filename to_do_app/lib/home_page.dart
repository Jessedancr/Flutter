import 'package:flutter/material.dart';
import 'my_bottom_sheet.dart';
import 'reusables/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  // List of to do items
  final List toDoItems = [
    ['Make tutorials', false],
    ['Buy groceries', false],
  ];

  // Function to check the checkbox
  void checkBoxChanged(bool value, int index) {
    setState(() {
      toDoItems[index][1] = !toDoItems[index][1];
    });
  }

  // Function to save new task
  void saveNewTask() {
    setState(() {
      toDoItems.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  // Function to add new task
  void createNewTask() {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.deepPurple[200],
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
            onCancel: () => Navigator.of(context).pop(),
            controller: _controller,
          );
        });
  }

  void deleteTask(index) {
    setState(() {
      toDoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'TO DO APP',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: createNewTask,
      ),
      body: ListView.builder(
        itemCount: toDoItems.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskDone: toDoItems[index][1],
            taskName: toDoItems[index][0],
            onChanged: (value) => checkBoxChanged(value!, index),
            deleteTask: (value) => deleteTask(index),
          );
        },
      ),
    );
  }
}
