import 'package:flutter/material.dart';
import 'package:gac/home/pages/sort_games/sort_games_page.dart';
import 'package:gac/shared/button_widget.dart';
import 'package:gac/shared/input_widget.dart';

class ConfigSortGamesPage extends StatefulWidget {
  ConfigSortGamesPage({Key? key}) : super(key: key);

  @override
  State<ConfigSortGamesPage> createState() => _ConfigSortGamesPageState();
}

class _ConfigSortGamesPageState extends State<ConfigSortGamesPage> {
  late TextEditingController numeroOpController;
  late TextEditingController numeroTimesController;
  late int numeroOp;

  @override
  void initState() {
    super.initState();

    numeroOpController = TextEditingController();
    numeroTimesController = TextEditingController();
  }

  @override
  void dispose() {
    numeroOpController.dispose();
    numeroTimesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sorteio de operadores")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 50),
              InputWidget.Number(
                text: 'Número de operadores',
                controller: numeroOpController,
              ),
              InputWidget.Number(
                text: 'Número de times',
                controller: numeroTimesController,
              ),
              const SizedBox(
                height: 100,
              ),
              ButtonWidget(
                //botao
                text: 'Iniciar Sorteio',
                onPressed: () {
                  if ((numeroOpController.text.isNotEmpty) &&
                      (int.parse(numeroOpController.text) >= 2)) {
                    numeroOp = int.parse(numeroOpController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SortGamesPage(
                          numeroTime: 2,
                          numeroOp: numeroOp,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
