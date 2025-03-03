import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final inputDecoration = InputDecoration(
      filled: true,
      hintText: "¿Que estas pensando?",
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          }),
    );
    return TextFormField(
        onTapOutside: (event) {
          focusNode
              .unfocus(); //dar click por fuera de la caja de texto y que se cierre
        },
        focusNode: focusNode,
        controller: textController,
        maxLines: null,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          onValue(value);
          textController.clear();
          focusNode.requestFocus();
        });
  }
}
