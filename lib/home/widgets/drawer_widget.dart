import 'package:flutter/material.dart';
import 'package:gac/shared/logo_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*void _sortGames() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SortGamesPage()),
      );
    }*/

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: LogoWidget(),
          ),
          ListTile(
            leading: Icon(Icons.wifi_protected_setup_sharp),
            title: Text('Ooção 1'),
            //onTap: _sortGames,
          ),
          const ListTile(
            leading: Icon(Icons.people),
            title: Text('Opção 2'),
          ),
          const ListTile(
            leading: Icon(Icons.people),
            title: Text('Opção 3'),
          ),
        ],
      ),
    );
  }
}
