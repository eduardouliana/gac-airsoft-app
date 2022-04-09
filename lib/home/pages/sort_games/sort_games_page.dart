import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gac/shared/button_widget.dart';

class SortGamesPage extends StatefulWidget {
  final int numeroTime;
  final int numeroOp;

  SortGamesPage({
    Key? key,
    required this.numeroOp,
    required this.numeroTime,
  }) : super(key: key);

  @override
  State<SortGamesPage> createState() => _SortGamesPageState();
}

class _SortGamesPageState extends State<SortGamesPage> {
  late String andamento;
  Color _cor = Colors.white38;
  late int numerodeOP;
  late TextEditingController _numero;
  late List<int> numberList;
  @override
  void initState() {
    super.initState();
    _numero = TextEditingController();
    numberList = [];
    andamento = '0 / ' + widget.numeroOp.toString();
  }

  @override
  void dispose() {
    _numero.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sortear operadores')),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sorteado: '),
                  Text(andamento),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: 200,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onLongPress: sorteio2,
                      color: _cor,
                      textColor: _cor,
                      child: Icon(
                        Icons.rotate_left_rounded,
                        size: 200,
                      ),
                      padding: EdgeInsets.all(50),
                      shape: CircleBorder(),
                      onPressed: voltarcor,
                    ),
                    const SizedBox(height: 10),
                    ButtonWidget(
                      //botao
                      text: 'Reiniciar',
                      onPressed: () {
                        print('limpo');
                        setState(() {
                          _cor = Colors.white30;
                          andamento = '0 / ' + widget.numeroOp.toString();
                        });
                        numberList.clear();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sorteio2() {
    int numero = widget.numeroOp;
    //

    for (var i = 1; i <= numero * 100; i++) {
      Random random = new Random();

      int random_number = random.nextInt(numero) + 1;

      if (!numberList.contains(random_number)) {
        numberList.add(random_number);
        //print(random_number);
        if ((random_number % 2) == 0) {
          setState(() {
            _cor = Colors.yellow;
          });
          print('par ' + random_number.toString());
        } else {
          setState(() {
            _cor = Colors.red;
          });
          print('impar ' + random_number.toString());
        }
        setState(() {
          andamento = numberList.length.toString() + ' / ' + numero.toString();
        });
        break;
      }
    }
  }

  void voltarcor() {
    setState(() {
      _cor = Colors.white30;
    });
  }
}
