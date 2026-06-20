import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? MyMessageBubble()
                      : HerMessageBubble();
                },
              ),
            ),
            const SizedBox(height: 10),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
