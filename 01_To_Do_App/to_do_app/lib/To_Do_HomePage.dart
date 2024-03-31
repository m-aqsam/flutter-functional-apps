// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/components/MyListTile.dart';
import 'package:to_do_app/components/My_DialogBox.dart';

class To_Do_HomePage extends StatefulWidget {
  const To_Do_HomePage({super.key});

  @override
  State<To_Do_HomePage> createState() => _To_Do_HomePageState();
}

class _To_Do_HomePageState extends State<To_Do_HomePage> {
  // TextEditing Controller

  final _controller = TextEditingController();
  // To Do List

  List todoList = [
    ["Do Exercise", false],
    ["Buy Groceries", false],
  ];

  // CheckBoxTap Method

  void checkBoxTap(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // Save Task Method

  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  // Cancel Button Method

  void cancelTask() {
    Navigator.of(context).pop();
  }

  // Create new Task Method

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return My_DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: cancelTask,
        );
      },
    );
  }

  // Delete Task Method

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text(
            "TO DO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      // add new Task  Button

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),

      // Body

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return MyListTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxTap(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
