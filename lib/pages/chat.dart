import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


const String openaiApiKey = "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";

class User {
  final String name;

  User(this.name);
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ChatScreen(),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xFFF3F7FA),
          color: const Color(0xFF122790),
          height: 65,
          index: 2,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/profile');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/main');
            }
          },
          items: const [
            Icon(Icons.account_circle_sharp, color: Colors.white),
            Icon(Icons.business, color: Colors.white),
            Icon(Icons.message, color: Colors.white),
          ]
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController textController = TextEditingController();
  final User currentUser = User('Me');
  final User otherUser = User('Other User');

  Future<String> getChatGptResponce(String text) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $openaiApiKey',
      },
      body: jsonEncode({
        'promt': text,
        'max_tokens': 50, //Максимальное кол-во символов в ответе
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to get responce from ChatGpt');
    }
  }

  void _handleSubmitted(String text, User user) async {
    if (text.isNotEmpty) {
      setState(() {
        messages.insert(0, {'text': text, 'user': user});
        textController.clear();
      });
      // Добавляем ответ пользователя
      if (user == currentUser) {
        final response = await getChatGptResponce(text);
        setState(() {
          messages.insert(0, {'text': response, 'user': otherUser});
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return ChatMessage(
                text: message['text'],
                user: message['user'],
                currentUser: currentUser,
              );
            },
            reverse: true,
          ),
        ),
        const Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: textController,
              onSubmitted: (text) => _handleSubmitted(text, currentUser),
              decoration:
                  const InputDecoration.collapsed(hintText: 'Отправьте сообщение'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(textController.text, currentUser),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final User user;
  final User currentUser;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.user,
      required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final isSentByMe = user == currentUser;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          isSentByMe
              ? Container()
              : CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(user.name[0]),
                ),
          Container(
            margin: isSentByMe
                ? const EdgeInsets.only(left: 50.0)
                : const EdgeInsets.only(right: 50.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.blue : Colors.grey[300],
              borderRadius: isSentByMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
            ),
            child: Text(text),
          ),
          isSentByMe
              ? CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(currentUser.name[0]),
                )
              : Container(),
        ],
      ),
    );
  }
}
