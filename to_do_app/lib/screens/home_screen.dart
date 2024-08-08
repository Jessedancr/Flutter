import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/logic/task_provider.dart';
import 'package:to_do_app/widgets/to_do_tile.dart';

import '../my_bottom_sheet.dart';

import 'package:to_do_app/widgets/my_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // LIST OF TASKS
    var tasks = context.watch<TaskProvider>().tasks;

    // FUNCTION TO SAVE NEW TASK
    void saveNewTask() {
      // Show snackbar if task is empty
      if (_controller.text.trim().isEmpty) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Can not add empty tasks'),
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(255, 187, 26, 14),
            padding: EdgeInsets.all(10),
          ),
        );
        return;
      }
      Navigator.of(context).pop();
      context.read<TaskProvider>().addTasks(_controller.text);
      _controller.clear();
    }

    // FUNCTION TO ADD NEW TASK
    void createNewTask() {
      // Show a modal sheet for adding new tasks
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

    // RETURNED WIDGET
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
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: tasks[index][0],
                taskDone: tasks[index][1],
                onChanged: (val) =>
                    context.read<TaskProvider>().isCompleted(val!, index),
                deleteTask: (context) =>
                    context.read<TaskProvider>().deleteTask(index),
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
