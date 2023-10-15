import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class User {
  final String name;

  User(this.name);
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatScreen(),
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
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController textController = TextEditingController();
  final User currentUser = User('Me');
  final User otherUser = User('Other User');
  int? replyToIndex;

  final Map<String, String> messageResponses = {
    'привет': 'Привет, как я могу помочь?',
    'как дела?': 'У меня все хорошо, спасибо!',
    'что делаешь?': 'Я помогаю вам! Как я могу помочь?',
    'расскажи про ипотеку':
        'У нас очень выгодные предложения по ипотеке) Хочешь расскажу подробнее?',
    'кто твои разработчики':
        'Меня создала команда CodeCat, я готов помогать тебе с любыми вопросам, не стесняйся, задавай.',
  };

  void _handleSubmitted(String text, User user) {
    if (text.isNotEmpty) {
      setState(() {
        String response = messageResponses[text.toLowerCase()] ??
            "Извините, не могу понять ваш запрос.";

        if (replyToIndex == null) {
          messages.insert(0, {'text': response, 'user': otherUser});
          messages.insert(1, {'text': text, 'user': user});
        } else {
          messages.insert(replyToIndex! + 1, {'text': text, 'user': user});
          messages
              .insert(replyToIndex! + 2, {'text': response, 'user': otherUser});
          replyToIndex = null;
        }
        textController.clear();
      });
    }
  }

  void setReplyTo(int index) {
    setState(() {
      replyToIndex = index;
      textController.text = "Reply to: ${messages[index]['text']}";
      textController.selection =
          TextSelection.collapsed(offset: textController.text.length);
    });
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
                index: index,
                setReplyTo: setReplyTo,
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
  final int index;
  final Function(int) setReplyTo;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.user,
      required this.currentUser,
      required this.index,
      required this.setReplyTo});

  @override
  Widget build(BuildContext context) {
    final isSentByMe = user == currentUser;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (!isSentByMe) {
                setReplyTo(index);
              }
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
