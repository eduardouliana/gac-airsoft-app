import 'package:flutter/material.dart';
import 'package:gac/home/pages/games/games_page.dart';
import 'package:gac/home/pages/members/members_page.dart';
import 'package:gac/home/pages/sort_games/config_sort_games_page.dart';
import 'package:gac/home/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('GAC - Grupo de Airsoft Cedrense'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Perfil'),
              ),
              Tab(
                child: Text('Jogos'),
              ),
              Tab(
                child: Text('Operadores'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text("Meu perfil")),
            GamesPage(),
            MembersPage(),
          ],
        ),
      ),
    );
  }
}
