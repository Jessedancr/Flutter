import 'package:flutter/material.dart';
import 'my_appbar.dart';
import 'my_bottom_sheet.dart';
import 'reusables/add_button.dart';
import 'reusables/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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

  // FUNCTION TO DELETE TASK
  void deleteTask(index) {
    setState(() {
      toDoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/background2.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            MyAppBar(),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
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
            ),

            // Add Button
            Positioned(
              bottom: 20,
              right: 20,
              child: AddButton(
                onTap: createNewTask,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
