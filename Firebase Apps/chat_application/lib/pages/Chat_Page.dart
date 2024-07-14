// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_application/components/Chat_Bubble.dart';
import 'package:chat_application/components/My_TextField.dart';
import 'package:chat_application/services/auth/Auth_Service.dart';
import 'package:chat_application/services/chat/Chat_Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat_Page extends StatelessWidget {
  final String recieverEmail;
  final String recieverID;
  Chat_Page({
    super.key,
    required this.recieverEmail,
    required this.recieverID,
  });

  // TExt Controller

  final TextEditingController txtController = TextEditingController();

  // chat and auth services

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // void sendMessage Method

  void sendMessage() async {
    // check if there is something to send a message

    if (txtController.text.isNotEmpty) {
      await _chatService.sendMessage(recieverID, txtController.text);
    }

    // clear the controller / Message box

    txtController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(recieverEmail),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),

          SizedBox(height: 10),

          // user input

          _buildUserInput(),
        ],
      ),
    );
  }

  // _buildMessageList Widget

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;

    return StreamBuilder(
      stream: _chatService.getMessage(recieverID, senderID),
      builder: (context, snapshot) {
        // errors

        if (snapshot.hasError) {
          return Text("Error ..!!");
        }

        // loading ....

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading ....");
        }

        // return listView

        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // _buildMessageItem

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user

    bool isCurrentUIser =
        data['senderID'] == _authService.getCurrentUser()!.uid;

    // check if the current user then message on right side other wise left side

    var alignment =
        isCurrentUIser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUIser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Chat_Bubble(message: data['message'], isCurrentUser: isCurrentUIser)
        ],
      ),
    );
  }

  // Build Message Input

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: My_TextField(
                hintText: "Type a message",
                obsecureText: false,
                controller: txtController),
          ),

          // send button

          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: sendMessage,
              icon: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
