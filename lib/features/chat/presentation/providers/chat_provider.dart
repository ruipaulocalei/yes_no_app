import 'package:flutter/material.dart';
import 'package:yes_no_app/features/chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final message = <Message>[
    Message(text: 'Hello', fromWho: FromWho.me),
    Message(text: 'Are you back from work', fromWho: FromWho.me),
    ];
}
