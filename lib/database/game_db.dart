import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gac/home/pages/games/game.dart';

class GameDB {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  final String _table = "jogos";

  Stream<List<Game>> getGames() {
    return _db.collection(_table).snapshots().map((snapshot) => snapshot.docs
        .map(
          (doc) => Game.fromJson(
            doc.data(),
          ),
        )
        .toList());
  }

  saveGame(Game game) {
    _db.collection(_table).doc(game.id).set(game.toMap());
  }

  deleteGame(String id) {
    _db.collection(_table).doc(id).delete();
  }
}
