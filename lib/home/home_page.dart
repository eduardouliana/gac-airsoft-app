import 'package:flutter/material.dart';
import 'package:gac/home/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GAC - Airsoft')),
      drawer: const DrawerWidget(),
      body: const Center(child: Text('Pagina...')),
    );
  }
}
