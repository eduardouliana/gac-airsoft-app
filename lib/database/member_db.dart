import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gac/home/pages/members/member.dart';

class MemberDB {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  final String _table = "operadores";

  Stream<List<Member>> getMembers() {
    return _db.collection(_table).snapshots().map((snapshot) => snapshot.docs
        .map(
          (doc) => Member.fromJson(
            doc.data(),
          ),
        )
        .toList());
  }

  saveMember(Member member) {
    _db.collection(_table).doc(member.id).set(member.toMap());
  }

  deleteMember(String id) {
    _db.collection(_table).doc(id).delete();
  }

  Future<Member> authenticate(String nick, String pwd) async {
    QuerySnapshot member = await _db
        .collection(_table)
        .where('apelido', isEqualTo: nick)
        .where('senha', isEqualTo: pwd)
        .get();

    if (member.docs.isEmpty) {
      throw Exception();
    }

    return Member.fromJson(member.docs.single.data() as Map<String, dynamic>);
  }
}
