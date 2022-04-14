import 'package:flutter/material.dart';
import 'package:gac/core/app_colors.dart';
import 'package:gac/core/app_text_styles.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController controller;

  const PasswordWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.key),
            ),
            hintText: 'Senha',
            hintStyle: AppTextStyles.editText),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textBackground,
      ),
    );
  }
}
