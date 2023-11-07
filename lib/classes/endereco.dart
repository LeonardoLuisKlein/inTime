class Endereco {
  final String id;
  final String endereco;
  final String bairro;
  final String cep;
  final String nome;
  final String cpf;
  final String telefone;

  Endereco({
    required this.id,
    required this.endereco,
    required this.bairro,
    required this.cep,
    required this.nome,
    required this.cpf,
    required this.telefone,
  });

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      id: json['id'],
      endereco: json['endereco'],
      bairro: json['bairro'],
      cep: json['cep'],
      nome: json['nome'],
      cpf: json['cpf'],
      telefone: json['telefone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'endereco': endereco,
      'bairro': bairro,
      'cep': cep,
      'nome': nome,
      'cpf': cpf,
      'telefone': telefone,
    };
  }
}
