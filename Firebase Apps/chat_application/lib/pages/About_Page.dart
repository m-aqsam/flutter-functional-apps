// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_application/components/Animate_Chat_Temp.dart';
import 'package:flutter/material.dart';
import 'package:typethis/typethis.dart';

class About_Page extends StatefulWidget {
  const About_Page({super.key});

  @override
  State<About_Page> createState() => _About_PageState();
}

class _About_PageState extends State<About_Page> {
  bool message1 = false;
  bool message2 = false;
  bool message3 = false;

  @override
  void initState() {
    super.initState();
    _TypeSpeedSequence();
  }

  void _TypeSpeedSequence() {
    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        message1 = true;
      });
    });
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        message2 = true;
      });
    });
    Future.delayed(Duration(seconds: 11), () {
      setState(() {
        message3 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // message 1
          if (message1)
            Align(
              alignment: Alignment.centerRight,
              child: Animate_Chat_Temp(
                text: 'Welcome, to QuickChat',
              ),
            ),

          // message 2
          if (message2)
            Align(
              alignment: Alignment.centerLeft,
              child: Animate_Chat_Temp(
                text: 'Design and dev by @aqsam .',
              ),
            ),
          // message 3
          if (message3)
            Align(
              alignment: Alignment.centerRight,
              child: Animate_Chat_Temp(
                text: 'Version : 3.0',
              ),
            ),
        ],
      ),
    );
  }
}
