import 'package:gac/core/app_colors.dart';
import 'package:gac/core/app_text_styles.dart';
import 'package:gac/database/member_db.dart';
import 'package:gac/home/home_page.dart';
import 'package:gac/home/pages/members/member.dart';
import 'package:gac/login/widgets/background_login_widget.dart';
import 'package:gac/login/widgets/forgot_password_widget.dart';
import 'package:gac/login/widgets/password_widget.dart';
import 'package:gac/login/widgets/sigin_widget.dart';
import 'package:gac/login/widgets/user_widget.dart';
import 'package:gac/shared/gac_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _userController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _userController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              const BackgroundLoginWidget(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 200),
                    const Center(child: GacWidget()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          UserWidget(controller: _userController),
                          const SizedBox(height: 22),
                          PasswordWidget(controller: _passwordController),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ForgotPasswordWidget(),
                              SigInWidget(onPressed: onPressLogin),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPressLogin() async {
    String login = _userController.text;
    String pwd = _passwordController.text;

    MemberDB memberDB = MemberDB();

    try {
      Member member = await memberDB.authenticate(login, pwd);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => HomePage(memberParam: member)),
      );
    } catch (_) {
      showAlertDialog(context);
    }
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Dados incorretos"),
    content: const Text("Usuário ou senha inválidos"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
