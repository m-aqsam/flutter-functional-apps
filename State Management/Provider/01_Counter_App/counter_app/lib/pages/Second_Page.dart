// ignore_for_file: prefer_const_constructors

import 'package:counter_app/models/Counter_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Second_Page extends StatefulWidget {
  const Second_Page({super.key});

  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterModel, child) => Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: counterModel.addCount,
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Text(
            counterModel.counter.toString(),
          ),
        ),
      ),
    );
  }
}

/*

 Main reason for second page is the states will be remain same 
 even you are making changes to second page as well

 */
