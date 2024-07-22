// ignore_for_file: prefer_const_constructors

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class Chat_Page extends StatefulWidget {
  const Chat_Page({super.key});

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  // OpenAi Instance
  final openAi = OpenAI.instance.build(
    token: 'Api token paste here',
    baseOption: HttpSetup(
      receiveTimeout: Duration(seconds: 5),
    ),
    enableLog: true,
  );

  // chatUser
  final ChatUser currentUser =
      ChatUser(id: '1', firstName: 'M', lastName: 'Aqsam');
  final ChatUser chatgptUser =
      ChatUser(id: '2', firstName: 'Chat', lastName: 'Gpt');

  // list of chatMessages
  List<ChatMessage> messages = <ChatMessage>[];

  // getChatMessage Method
  Future<void> getChatMessage(ChatMessage m) async {
    setState(() {
      messages.insert(0, m);
    });

    // Memory => All Chat History from the user (for better response)
    List<Map<String, dynamic>> messageHistory = messages.reversed.map((m) {
      if (m.user == currentUser) {
        return {
          'role': 'user',
          'content': m.text,
        };
      } else {
        return {
          'role': 'assistant',
          'content': m.text,
        };
      }
    }).toList();

    final request = ChatCompleteText(
      model: GptTurboChatModel(),
      messages: messageHistory,
      maxToken: 200,
    );

    try {
      final response = await openAi.onChatCompletion(request: request);
      if (response != null && response.choices != null) {
        for (var element in response.choices!) {
          if (element.message != null) {
            setState(() {
              messages.insert(
                0,
                ChatMessage(
                  user: chatgptUser,
                  createdAt: DateTime.now(),
                  text: element.message!.content,
                ),
              );
            });
          }
        }
      } else {
        print("Failed to get a valid response");
      }
    } catch (e) {
      print("OpenAIServerError: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Center(child: Text("ChatterAI")),
        backgroundColor: Color.fromRGBO(0, 166, 126, 1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DashChat(
          currentUser: currentUser,
          messageOptions: MessageOptions(
            textColor: Colors.white,
            currentUserContainerColor: Colors.grey[700],
            containerColor: Color.fromRGBO(0, 166, 126, 1),
          ),
          onSend: (ChatMessage m) {
            getChatMessage(m);
          },
          messages: messages,
        ),
      ),
    );
  }
}
