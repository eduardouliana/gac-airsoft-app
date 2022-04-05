import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Carregando...',
      style: TextStyle(
        fontSize: 32.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
