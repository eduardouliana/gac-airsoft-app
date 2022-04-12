import 'package:gac/database/member_db.dart';
import 'package:gac/home/home_page.dart';
import 'package:gac/home/pages/members/member.dart';
import 'package:gac/login/widgets/background_widget.dart';
import 'package:gac/shared/button_widget.dart';
import 'package:gac/shared/input_widget.dart';
import 'package:gac/shared/logo_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _nickController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _nickController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nickController.dispose();
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
              const BackgroundWidget(),
              const LogoWidget(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 350),
                          InputWidget.Text(
                            text: 'Apelido',
                            controller: _nickController,
                          ),
                          const SizedBox(height: 10),
                          InputWidget.Password(
                            text: 'Senha',
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.blue,
                              onSurface: Colors.red,
                            ),
                            onPressed: null,
                            child: ButtonWidget(
                              text: 'Entrar',
                              onPressed: () => onPressLogin(context),
                            ),
                          )
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

  void onPressLogin(BuildContext ctx) async {
    String login = _nickController.text;
    String pwd = _passwordController.text;

    MemberDB memberDB = MemberDB();

    try {
      Member member = await memberDB.authenticate(login, pwd);

      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (ctx) => HomePage(memberParam: member)),
      );
    } catch (_) {
      showAlertDialog1(ctx);
    }
  }
}

showAlertDialog1(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Dados incorretos"),
    content: Text("Usuario ou senha inválida"),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
