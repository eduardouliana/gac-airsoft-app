import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gac/home/pages/members/member.dart';
import 'package:gac/shared/button_widget.dart';
import 'package:gac/shared/input_widget.dart';
import 'package:uuid/uuid.dart';

class AddMemberPage extends StatefulWidget {
  final Member? memberParam;
  const AddMemberPage({
    Key? key,
    this.memberParam,
  }) : super(key: key);

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  late TextEditingController nomeController;
  late TextEditingController apelidoController;
  late TextEditingController telefoneController;
  late TextEditingController senhaController;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController();
    apelidoController = TextEditingController();
    telefoneController = TextEditingController();
    senhaController = TextEditingController();

    if (widget.memberParam != null) {
      // Editar
      nomeController.text = widget.memberParam!.nome;
      apelidoController.text = widget.memberParam!.apelido;
      telefoneController.text = widget.memberParam!.telefone;
      senhaController.text = widget.memberParam!.senha;
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    apelidoController.dispose();
    telefoneController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de jogador")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            InputWidget.Text(
              text: 'Nome:',
              controller: nomeController,
            ),
            InputWidget.Text(
              text: 'Apelido:',
              controller: apelidoController,
            ),
            InputWidget.Number(
              text: 'Telefone:',
              controller: telefoneController,
            ),
            InputWidget.Password(
              text: 'Senha:',
              controller: senhaController,
            ),
            ButtonWidget(text: 'Cadastrar', onPressed: onPress),
          ]),
        ),
      ),
    );
  }

  void onPress() {
    String id = const Uuid().v1();

    if (widget.memberParam != null) {
      id = widget.memberParam!.id;
    }

    Member member = Member(
      id: id,
      nome: nomeController.text,
      apelido: apelidoController.text,
      telefone: telefoneController.text,
      senha: senhaController.text,
    );

    db.collection("operadores").doc(id).set(member.toMap());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cadastrado com sucesso"),
      ),
    );

    Navigator.of(context).pop();
  }
}
