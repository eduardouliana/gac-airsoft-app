import 'package:flutter/material.dart';
import 'package:gac/shared/logo_widget.dart';
import 'package:gac/sort_games/sort_games_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _sortGames() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SortGamesPage()),
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: LogoWidget(),
          ),
          ListTile(
            leading: Icon(Icons.wifi_protected_setup_sharp),
            title: Text('Sorteio'),
            onTap: _sortGames,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Opção 2'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Opção 3'),
          ),
        ],
      ),
    );
  }
}
