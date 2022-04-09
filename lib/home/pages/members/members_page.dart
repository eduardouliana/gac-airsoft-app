import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gac/home/pages/members/add_member_page.dart';
import 'package:gac/home/pages/members/member.dart';
import 'package:gac/shared/logo_widget.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Member>> get members => getMembers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Member>>(
        stream: members,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final Member member = snapshot.data![index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      child: ListTile(
                        trailing: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Op. ' + member.apelido,
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          member.nome,
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: Container(
                          height: 75,
                          width: 75,
                          child: Center(
                            child: LogoWidget(),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddMemberPage(
                                memberParam: member,
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
              builder: (context) => AddMemberPage(),
            ),
          );
        },
      ),
    );
  }

  Stream<List<Member>> getMembers() {
    return db
        .collection("operadores")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => Member.fromJson(
                doc.data(),
              ),
            )
            .toList());
  }
}
