import 'package:flutter/material.dart';

class BackgroundSplashWidget extends StatelessWidget {
  const BackgroundSplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('imagens/splash.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
