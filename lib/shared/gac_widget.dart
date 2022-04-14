import 'package:flutter/material.dart';
import 'package:gac/core/app_text_styles.dart';

class GacWidget extends StatelessWidget {
  const GacWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'GAC',
          style: AppTextStyles.splashTitle,
        ),
        Text(
          'Controle de jogos',
          style: AppTextStyles.splashSubtitle,
        ),
      ],
    );
  }
}
