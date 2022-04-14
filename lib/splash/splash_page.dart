import 'dart:async';

import 'package:gac/login/login_page.dart';
import 'package:gac/splash/widgets/background_splash_widget.dart';
import 'package:gac/shared/gac_widget.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundSplashWidget(),
          const Center(
            child: GacWidget(),
          ),
        ],
      ),
    );
  }
}
