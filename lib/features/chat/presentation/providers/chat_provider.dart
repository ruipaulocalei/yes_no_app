import 'package:flutter/material.dart';
import 'package:yes_no_app/features/chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final messages = <Message>[
    Message(text: 'Hello love?', fromWho: FromWho.me),
    Message(text: 'Are you back from work', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    notifyListeners();
  }
}
