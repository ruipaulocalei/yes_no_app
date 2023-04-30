import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.send_outlined,
          ),
        ),
      ),
    );
  }
}
