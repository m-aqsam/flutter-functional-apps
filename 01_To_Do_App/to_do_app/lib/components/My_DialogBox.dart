// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/components/MyButton.dart';

class My_DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  My_DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        // padding: EdgeInsets.symmetric(vertical: 2),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text Field  for User Input

            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Task Name ",
              ),
            ),

            // Button -> Save and Cancel

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save Button

                MyButton(
                  buttonName: "Save",
                  onPressed: onSave,
                ),

                SizedBox(width: 6),

                // Cancel Button

                MyButton(
                  buttonName: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
