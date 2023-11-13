import 'package:flutter/material.dart';
import 'package:todoapp/Components/dialog_box.dart';
import 'package:todoapp/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  // Text controller
  final _controller = TextEditingController();
  // List of todo items
  List toDoItems = [
    ["Make tutorial", false],
    ["Dance practice", true],
    ["Do exercise", false],
  ];

  // Function to check or uncheck the box
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoItems[index][1] = !toDoItems[index][1];
    });
  }

  // Function to save new task
  void SaveNewTask(){
    setState(() {
      toDoItems.add([controller.text]);
    });
  }

  // Function to create new task
  void createNewtask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: SaveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    });
  }
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("MY TODO APP"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        child: Icon(Icons.add),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoItems.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoItems[index][0],
            taskDone: toDoItems[index][1],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
          );
        },
      ),
    );
  }
}
