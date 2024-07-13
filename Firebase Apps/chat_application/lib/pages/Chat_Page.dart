import 'package:flutter/material.dart';

class Chat_Page extends StatelessWidget {
  final String recieverEmail;
  const Chat_Page({
    super.key,
    required this.recieverEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recieverEmail),
      ),
    );
  }
}
