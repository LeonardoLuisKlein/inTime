class ProdutoCarrinho {
  final String id;
  final String nome;
  final String categoria;
  final String imagem;
  final int quantidade;
  final double valorUnit;
  final double valorTotal;

  ProdutoCarrinho({
    required this.id,
    required this.nome,
    required this.categoria,
    required this.imagem,
    required this.quantidade,
    required this.valorUnit,
    required this.valorTotal,
  });

  factory ProdutoCarrinho.fromJson(Map<String, dynamic> json) {
    return ProdutoCarrinho(
      id: json['id'],
      nome: json['nome'],
      categoria: json['categoria'],
      imagem: json['imagem'],
      quantidade: json['quantidade'],
      valorUnit: json['valorUnit'].toDouble(),
      valorTotal: json['valorTotal'].toDouble(),
    );
  }
}
