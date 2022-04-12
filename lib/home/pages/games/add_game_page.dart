import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gac/home/pages/games/game.dart';
import 'package:gac/shared/button_widget.dart';
import 'package:gac/shared/input_widget.dart';
import 'package:uuid/uuid.dart';

class AddGamePage extends StatefulWidget {
  final Game? gameParam;
  const AddGamePage({
    Key? key,
    this.gameParam,
  }) : super(key: key);

  @override
  State<AddGamePage> createState() => _AddGamePageState();
}

class _AddGamePageState extends State<AddGamePage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  late TextEditingController nomeController;
  late TextEditingController descricaoController;
  late TextEditingController localController;
  late TextEditingController dataController;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController();
    descricaoController = TextEditingController();
    localController = TextEditingController();
    dataController = TextEditingController();

    if (widget.gameParam != null) {
      // Editar
      nomeController.text = widget.gameParam!.nome;
      descricaoController.text = widget.gameParam!.descricao;
      localController.text = widget.gameParam!.local;
      dataController.text = widget.gameParam!.data;
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    descricaoController.dispose();
    localController.dispose();
    dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de jogos")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            InputWidget.Text(
              text: 'Nome:',
              controller: nomeController,
            ),
            InputWidget.MultiLineText(
              text: 'Descrição:',
              controller: descricaoController,
            ),
            InputWidget.Text(
              text: 'Local:',
              controller: localController,
            ),
            InputWidget.Date(
              text: 'Data:',
              controller: dataController,
            ),
            ButtonWidget(text: 'Cadastrar', onPressed: onPress),
          ]),
        ),
      ),
    );
  }

  void onPress() {
    String id = const Uuid().v1();

    if (widget.gameParam != null) {
      id = widget.gameParam!.id;
    }

    Game game = Game(
      id: id,
      nome: nomeController.text,
      descricao: descricaoController.text,
      local: localController.text,
      data: dataController.text,
    );

    db.collection("jogos").doc(id).set(game.toMap());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cadastrado com sucesso"),
      ),
    );

    Navigator.of(context).pop();
  }
}
