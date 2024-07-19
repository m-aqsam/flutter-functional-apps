// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_call_super

import 'package:chat_application/components/Chat_Bubble.dart';
import 'package:chat_application/components/My_TextField.dart';
import 'package:chat_application/services/auth/Auth_Service.dart';
import 'package:chat_application/services/chat/Chat_Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat_Page extends StatefulWidget {
  final String recieverEmail;
  final String recieverID;
  Chat_Page({
    super.key,
    required this.recieverEmail,
    required this.recieverID,
  });

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  // TExt Controller
  final TextEditingController txtController = TextEditingController();

  // chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // Focus Node => For textfield focus then add scroll

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // add listener to focus node
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        // cause a delay so the keyboard has to show up
        // then the remaining space will be calculated on page
        // then scroll down

        Future.delayed(
          Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });

    // wait for the listView to show and then scroll to the bottom
    Future.delayed(
      Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    txtController.dispose();
    super.dispose();
  }

  // Scroll Controller
  final ScrollController scrollController = ScrollController();

  void scrollDown() {
    // scroll down to the bottom of the list
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
  }

  // void sendMessage Method
  void sendMessage() async {
    // check if there is something to send a message

    if (txtController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.recieverID, txtController.text);
    }

    // clear the controller / Message box

    txtController.clear();
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(widget.recieverEmail),
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
      stream: _chatService.getMessage(widget.recieverID, senderID),
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
          controller: scrollController,
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // _buildMessageItem widget
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
              controller: txtController,
              focusNode: focusNode,
            ),
          ),

          // Send button

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
