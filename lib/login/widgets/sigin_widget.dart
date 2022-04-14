import 'package:flutter/material.dart';
import 'package:gac/core/app_colors.dart';
import 'package:gac/core/app_text_styles.dart';

class SigInWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const SigInWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 138,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.buttonBackground,
      ),
      child: TextButton(
        child: Text(
          'Entrar',
          style: AppTextStyles.buttonText,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
