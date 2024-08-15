import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/logic/task_provider.dart';
import 'package:to_do_app/widgets/to_do_tile.dart';

import '../my_bottom_sheet.dart';

import 'package:to_do_app/widgets/my_floating_action_button.dart';

/// The HomeScreen widget is the main screen of thr to-do app
/// It displays a list of tasks and allows users to add new tas
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Gets the list of tasks from the task provider
    var tasks = context.watch<TaskProvider>().tasks;

    /// Function to save a new task to the task provider
    /// If the task is empty, show a snackbar error message
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

    /// Function to add a new task
    /// Show a modal sheet for adding new tasks
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

    /// The main widget of the homescreen
    /// It displays a list of tasks and a floating action
    /// button to add new tasks
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
                dateTime: tasks[index][2],
                onChanged: (val) =>
                    context.read<TaskProvider>().isCompleted(val!, index),
                deleteTask: (context) =>
                    context.read<TaskProvider>().deleteTask(index),
                loadingStateIndex: index,
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
