import 'package:flutter/material.dart';
import 'package:yes_no_app/features/chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final messages = <Message>[
    Message(text: 'Hello love?', fromWho: FromWho.me),
    Message(text: 'Are you back from work', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty)return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }
  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent , duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
