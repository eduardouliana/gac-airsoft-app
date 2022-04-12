import 'package:flutter/material.dart';
import 'package:gac/database/member_db.dart';
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
  MemberDB memberDB = MemberDB();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(text: 'Salvar', onPressed: onPressAdd),
                (widget.memberParam != null)
                    ? ButtonWidget(text: 'Excluir', onPressed: onPressDelete)
                    : Container(),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void onPressAdd() {
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

    memberDB.saveMember(member);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cadastrado com sucesso"),
      ),
    );

    Navigator.of(context).pop();
  }

  void onPressDelete() {
    memberDB.deleteMember(widget.memberParam!.id);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Excluído com sucesso"),
      ),
    );
    Navigator.of(context).pop();
  }
}
