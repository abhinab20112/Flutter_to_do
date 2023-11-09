// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/dialog_box.dart';
import 'package:to_do/todoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// ignore: unused_field
  final _myBox = Hive.box('lists');

  @override
  void initState() {
    if (_myBox.get('tasks') == Null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  toDoDataBase db = toDoDataBase();

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialog_box(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Center(child: Text("TO DO")),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
          ),
        ),
        backgroundColor: Colors.lightBlue[100],
        body: ListView.builder(
            itemCount: db.tasks.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.tasks[index][0],
                taskCompleated: db.tasks[index][1],
                onChanged: (value) => checkBoxChange(value, index),
                DeleteButton: (context) => deleteTask(index),
              );
            }));
  }
}
