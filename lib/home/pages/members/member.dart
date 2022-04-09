class Member {
  final String id;

  final String nome;
  final String apelido;
  final String telefone;
  final String senha;
  // Demais campos

  Member({
    required this.id,
    required this.nome,
    required this.apelido,
    required this.telefone,
    required this.senha,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    print(json);

    return Member(
      id: json['id'],
      nome: json['nome'],
      apelido: json['apelido'],
      telefone: json['telefone'],
      senha: json['senha'],
      // Demais campos
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'apelido': apelido,
      'telefone': telefone,
      'senha': senha,
      // Demais campos
    };
  }
}
