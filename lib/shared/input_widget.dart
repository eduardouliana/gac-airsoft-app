import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String text;
  final TextInputType keyboartType;
  final TextEditingController controller;
  final bool obscuredText;
  int minLines = 1;
  int maxLines = 1;

  InputWidget({
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

  InputWidget.MultiLineText({
    required this.text,
    required this.controller,
  })  : keyboartType = TextInputType.text,
        obscuredText = false,
        minLines = 3,
        maxLines = 10;

  InputWidget.Number({
    required this.text,
    required this.controller,
  })  : keyboartType = TextInputType.number,
        obscuredText = false;

  InputWidget.Date({
    required this.text,
    required this.controller,
  })  : keyboartType = TextInputType.datetime,
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
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(labelText: text),
    );
  }
}
