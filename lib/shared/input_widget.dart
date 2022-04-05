import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String text;
  final TextInputType keyboartType;
  final TextEditingController controller;
  final bool obscuredText;

  const InputWidget({
    Key? key,
    required this.text,
    required this.keyboartType,
    required this.controller,
    required this.obscuredText,
  }) : super(key: key);

  InputWidget.Text({
    required this.text,
    required this.controller,
  })  : keyboartType = TextInputType.text,
        obscuredText = false;

  InputWidget.Password({
    required this.text,
    required this.controller,
  })  : keyboartType = TextInputType.text,
        obscuredText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboartType,
      obscureText: obscuredText,
      controller: controller,
      decoration: InputDecoration(labelText: text),
    );
  }
}
