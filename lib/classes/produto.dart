class Produto {
  final String nome;
  final String categoria;
  final List<String>? opcoes;
  final String imagem;
  final int quantidade;
  final double valor;

  Produto({
    required this.nome,
    required this.categoria,
    this.opcoes,
    required this.imagem,
    required this.quantidade,
    required this.valor,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      categoria: json['categoria'],
      opcoes: json['opcao'] != null ? List<String>.from(json['opcao']) : null,
      imagem: json['imagem'],
      quantidade: json['quantidade'],
      valor: json['valor'].toDouble(),
    );
  }
}
