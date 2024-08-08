import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskProvider extends ChangeNotifier {
  List tasks = [];

  // Referencing the opened box
  final _myBox = Hive.box('myBox');

  TaskProvider() {
    // if there's no data in hive, show the initial data
    // else load the data
    if (_myBox.get('toDoItem') == null) {
      initialData();
    } else {
      loadData();
    }
  }

  // Run this function if this is the first time ever opening the app
  void initialData() {
    tasks = [
      ["Tap checkbox to finish a task", false],
      ['Swipe left to delete task', false],
      ['tap the \'+\' button to add new task', false],
    ];
    _myBox.put('toDoItem', tasks);
  }

  // Function to laad data from the database
  void loadData() {
    tasks = _myBox.get("toDoItem");
    notifyListeners();
  }

  // Function to update the databse
  void updateData() {
    _myBox.put("toDoItem", tasks);
    notifyListeners();
  }

  // Function to check the checkbox
  isCompleted(bool val, int index) {
    tasks[index][1] = val;
    updateData();
    notifyListeners();
  }

  // Function to add task to the DB
  void addTasks(String taskName) {
    tasks.add([taskName, false]);
    updateData();
    notifyListeners();
  }

  // Delete function
  void deleteTask(int index) {
    tasks.removeAt(index);
    updateData();
    notifyListeners();
  }

  // Delete all function
  void deleteAll() {
    tasks.clear();
    updateData();
    notifyListeners();
  }
}
