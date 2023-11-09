import 'package:hive_flutter/hive_flutter.dart';

// ignore: camel_case_types
class toDoDataBase {
  List tasks = [];
  // ignore: unused_field
  final _myBox = Hive.box('lists');

  void createInitialData() {
    tasks = [
      ["arya moan", false],
      ["batak", false],
      ["banka", false],
      ["saturday", false],
      ["si moan", false],
      ["lipstick auinty", false],
    ];
  }

  void loadData() {
    var loadedTasks = _myBox.get('tasks');
    if (loadedTasks != null && loadedTasks is List) {
      tasks = loadedTasks;
    }
  }

  void updateData() {
    _myBox.put('tasks', tasks);
  }
}
