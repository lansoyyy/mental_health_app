import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/services/add_messages.dart';
import 'package:mental_health_app/widgets/text_widget.dart';

import '../services/api_service.dart';

class ChatScreen extends StatefulWidget {
  String time;

  ChatScreen({
    super.key,
    required this.time,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) async {
    if (text.isEmpty) return;

    _textController.clear();
    setState(() {
      _messages.add('User: $text');
    });

    final String response = await ChatGPTService().getResponse(text);
    setState(() {
      _messages.add('ChatGPT: $response');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          title: TextWidget(
            text: 'Chat',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) =>
                    ListTile(title: Text(_messages[index])),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration:
                          const InputDecoration(hintText: 'Send a message'),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () => _handleSubmitted(_textController.text),
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
