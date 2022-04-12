import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gac/home/pages/games/add_game_page.dart';
import 'package:gac/home/pages/games/game.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Game>> get members => getGames();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Game>>(
        stream: members,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final Game game = snapshot.data![index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      child: ListTile(
                        trailing: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        title: Text(
                          game.nome,
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          'Local: ' + game.local + ' -- Data: ' + game.data,
                          style: const TextStyle(color: Colors.black),
                        ),
                        // leading: Container(
                        //   height: 75,
                        //   width: 75,
                        //   child: Center(
                        //     child: LogoWidget(),
                        //   ),
                        // ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddGamePage(
                                gameParam: game,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddGamePage(),
            ),
          );
        },
      ),
    );
  }

  Stream<List<Game>> getGames() {
    return db.collection("jogos").snapshots().map((snapshot) => snapshot.docs
        .map(
          (doc) => Game.fromJson(
            doc.data(),
          ),
        )
        .toList());
  }
}
