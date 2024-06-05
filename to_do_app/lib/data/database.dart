import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoItems = [];

  // Referencing our box
  final _myBox = Hive.box('myBox');

  // Run this method if this is the first time ever opening the app
  void initialData() {
    toDoItems = [
      ["Click the checkbox to complete a task", false],
      ['Swipe left to delete task', false],
      ['tap the \'+\' button to add new task', false],
    ];
  }

  // Function to laad data from the database
  void loadData() {
    toDoItems = _myBox.get("ToDoItem");
  }

  // Function to update the databse
  void updateData() {
    _myBox.put("ToDoItem", toDoItems);
  }
}
