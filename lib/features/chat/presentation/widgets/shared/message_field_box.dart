import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      onFieldSubmitted: (value) {
        debugPrint(value);
        textController.clear();
        focusNode.requestFocus();
      },
      decoration: InputDecoration(
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            debugPrint(textValue);
            textController.clear();
          },
          icon: const Icon(
            Icons.send_outlined,
          ),
        ),
      ),
    );
  }
}
