class Game {
  final String id;

  final String nome;
  final String descricao;
  final String local;
  final String data;
  // Demais campos

  Game({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.local,
    required this.data,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      local: json['local'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'local': local,
      'data': data,
    };
  }
}
