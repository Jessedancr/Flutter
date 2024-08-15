// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var box = Hive.openBox('myBox');

  // Referencing The box
  final _myBox = Hive.box('myBox');

  // write data
  void writeData() {
    _myBox.put(1, "Jessedancr");
  }

  // read data
  void readData() {
    print(_myBox.get(1));
  }

  // delete data
  void deleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: writeData,
              child: Text('WRITE'),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: readData,
              child: Text('READ'),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.teal),
              ),
            ),
            ElevatedButton(
              onPressed: deleteData,
              child: Text('DELETE'),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
