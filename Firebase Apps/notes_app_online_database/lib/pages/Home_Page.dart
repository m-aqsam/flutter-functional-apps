// ignore_for_file: prefer_const_constructors, unused_field, camel_case_types

import 'package:flutter/material.dart';
import 'package:notes_app_online_database/services/Firestore_Services.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  // acces FirestoreService class

  final FirestoreService firestoreService = FirestoreService();

// TextField Controller

  final TextEditingController txtController = new TextEditingController();
  // open input dialogue box

  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: txtController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // add note to database
              firestoreService.addNote(txtController.text);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Center(
          child: Text("Notes App"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: Icon(Icons.add),
      ),
    );
  }
}
