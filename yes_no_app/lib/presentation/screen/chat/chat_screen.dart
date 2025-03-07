import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                      "https://minaslaaurora.com/wp-content/uploads/2024/09/cotterweb.png")),
            ),
            title: const Text('Chat'),
            backgroundColor: Colors.red),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        controller: chatProvider.scrollController,
                        itemCount: chatProvider.messagesList.length,
                        itemBuilder: (context, index) {
                          final message = chatProvider.messagesList[index];
                          return (message.fromWho == FromWho.hers)
                              ? HerMessageBubble(message: message)
                              : MyMessageBubble(message: message);
                        })),
                MessageFieldBox(onValue: chatProvider.sendMessage)
              ],
            )));
  }
}
