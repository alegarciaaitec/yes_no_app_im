import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_im/domain/entities/message.dart';
import 'package:yes_no_app_im/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_im/presentation/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://thesoundofvinyl.us/cdn/shop/products/dua1.png?v=1674161445',
            ),
          ),
        ),
        title: const Text('Dua Lipa'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.mine)
                      ? MyMessageBubble(message: message)
                      : HerMessageBubble(message: message);
                },
              ),
            ),
            const SizedBox(height: 10),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
