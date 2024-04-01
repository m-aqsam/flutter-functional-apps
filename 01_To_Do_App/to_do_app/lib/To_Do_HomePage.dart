// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/Setting_Page.dart';
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
    ["Tap + to add new task ", false],
    ["Swipe Left to Delete", false],
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

  // Edit Task Method

  // My Method

  // void editTask(index) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return My_DialogBox(
  //         controller: _controller,
  //         onSave: changeTask,
  //         onCancel: cancelTask,
  //       );
  //     },
  //   );
  // }

  // ChatGpt Method

  void editTask(int index) {
    _controller.text = todoList[index][0]; // Set the initial text in the dialog
    showDialog(
      context: context,
      builder: (context) {
        return My_DialogBox(
          controller: _controller,
          onSave: () => changeTask(index), // Pass the index argument here
          onCancel: cancelTask,
        );
      },
    );
  }

  // ChangeTask Method

  void changeTask(index) {
    setState(() {
      //todoList.insert(index, [_controller.text, false]);
      todoList[index][0] = _controller.text;
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text(
            "T O  D O",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      // add new Task  Button

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.black,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.yellow,
          size: 30,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Nav Bar

      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icons Button

            // Home

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 45,
                color: Colors.black,
              ),
            ),

            SizedBox(width: 140),

            // Setting

            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (Context) {
                    return Setting_Page();
                  },
                ));
              },
              icon: Icon(
                Icons.settings,
                size: 45,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),

      // Body

      body: Container(
        height: 690,
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return MyListTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxTap(value, index),
              deleteFunction: (context) => deleteTask(index),
              editFunction: (context) => editTask(index),
            );
          },
        ),
      ),
    );
  }
}
