import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;


/// A provider class that manages a list of tasks and provides functionality to
/// add, delete, and update tasks.
class TaskProvider extends ChangeNotifier {
  /// A list of tasks, where each task is a list containing the task name, a boolean
  /// indicating whether the task is completed, and a string representing the task's
  /// creation date and time.
  List tasks = [];

  /// A map that tracks the loading state of each individual task.
  final Map<int, bool> taskLoadingState = {};

  /// A reference to the opened Hive box.
  final _myBox = Hive.box('myBox');

  /// Constructor that initializes the task list and loads data from Hive if it exists.
  TaskProvider() {
    // if there's no data in hive, show the initial data
    // else load the data
    if (_myBox.get('toDoItem') == null) {
      initialData();
    } else {
      loadData();
    }
  }

  /// Fetches the current date and time from the World Time API.
  /// Returns a string representing the current date and time in the format
  Future fetchDateTime() async {
    print('API call start');
    const url =
        'https://api.timezonedb.com/v2.1/get-time-zone?key=FHTDZUSZW6UJ&format=json&by=zone&zone=Africa/Lagos';
    final uri = Uri.parse(url); // Parsing the url string to a URI object

    for (int i = 0; i < 3; i++) {
      try {
        final response =
            await http.get(uri).timeout(const Duration(seconds: 10));
        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body);
          final dateTime = json['formatted'];

          print(dateTime);
          print('API call finish');
          return dateTime; // Exit the loop and return the formatted date
        } else {
          print('Failed to load dateTime, status code: ${response.statusCode}');
        }
      } catch (e) {
        print("Attempt $i failed: $e");
      }

      // If we reach this point, the try block failed, and we are retrying
      if (i == 2) {
        // After the last attempt, return an error
        return "Error fetching DateTime";
      }
    }
  }

  /// Initializes the task list with default data if it's the first time opening the app.
  void initialData() {
    tasks = [
      ["Tap checkbox to finish a task", false, ""],
      ['Swipe left to delete task', false, ""],
      ['tap the \'+\' button to add new task', false, ""],
    ];

    _myBox.put('toDoItem', tasks);
  }

  /// Function to laad data from the database
  void loadData() {
    tasks = _myBox.get("toDoItem");
    notifyListeners();
  }

  /// Function to update the databse with current task list
  void updateData() {
    _myBox.put("toDoItem", tasks);
    notifyListeners();
  }

  /// Toggles the completion state of a task.
  /// @param val The new completion state of the task.
  /// @param index The index of the task in the task list.
  isCompleted(bool val, int index) {
    tasks[index][1] = val;
    updateData();
    notifyListeners();
  }

  /// Adds a new task to the task list and updates the Hive database.
  /// @param taskName The name of the new task.
  Future<void> addTasks(String taskName) async {
    final int taskIndex = tasks.length; // Get the length of current tasks
    tasks.add([taskName, false, ""]);
    taskLoadingState[taskIndex] = true;
    notifyListeners();

    final dateTime = await fetchDateTime(); // api call
    tasks[tasks.length - 1][2] = dateTime; // Update the new task's datetime
    // Set the loading state of new task to false after API is called
    taskLoadingState[taskIndex] = false;
    updateData();
    notifyListeners();
  }

  /// Checks the loading state of a task.
  /// Returns true if the task is loading, and false otherwise. If the loading state
  /// is not found (null), it defaults to false.
  /// @param index The index of the task in the task list.
  bool isLoading(int index) => taskLoadingState[index] ?? false;

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
