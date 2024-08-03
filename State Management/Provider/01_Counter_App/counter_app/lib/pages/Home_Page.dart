// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:counter_app/models/Counter_Model.dart';
import 'package:counter_app/pages/Second_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<CounterProvider>(
        builder: (context, counterModel, child) => Scaffold(
          appBar: AppBar(
            title: Text("Counter App"),
          ),
          backgroundColor: Colors.grey[300],
          floatingActionButton: FloatingActionButton(
            onPressed: counterModel.addCount,
            child: Icon(Icons.add),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // text
                Text("Number of times you Click is :"),

                // counter

                Text(
                  counterModel.counter.toString(),
                ),

                SizedBox(height: 100),

                // Button

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Second_Page(),
                    ));
                  },
                  child: Text("Next Page"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
