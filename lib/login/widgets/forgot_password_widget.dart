import 'package:flutter/material.dart';
import 'package:gac/core/app_text_styles.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Esqueceu a senha?',
      style: AppTextStyles.buttonText,
    );
  }
}
