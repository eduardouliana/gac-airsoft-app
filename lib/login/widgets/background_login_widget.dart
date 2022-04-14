import 'package:flutter/material.dart';

class BackgroundLoginWidget extends StatelessWidget {
  const BackgroundLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('imagens/login.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
