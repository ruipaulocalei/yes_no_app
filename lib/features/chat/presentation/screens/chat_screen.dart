import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/features/chat/presentation/providers/chat_provider.dart';

import '../../domain/entities/message.dart';
import '../widgets/her_message_bubble.dart';
import '../widgets/my_message_bubble.dart';
import '../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const Text('Chat'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5VMOjDsTFwUrLtahsZZvkEslN6h4HGcuP3Ktfvgn8fULiiRHCF2zwO35YB_h3Dq_Nb2s&usqp=CAU'),
            ),
          )
        ],
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
                return (message.fromWho == FromWho.hers)
                    ? const HerMessageBubble()
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
