import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_time/classes/produtoCarrinho.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key}) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  void initState() {
    super.initState();
  }

  deleteProduct(ProdutoCarrinho produto) async {
    {
      final User? user = FirebaseAuth.instance.currentUser;
      final String? userId = user?.uid;

      if (userId != null) {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userId)
            .collection('carrinho')
            .doc(produto.id)
            .delete();
      }
    }
  }

  Future<List<ProdutoCarrinho>> _getCarrinhoProdutos() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    if (userId == null) {
      // Nenhum usuário está autenticado.
      return [];
    }

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userId)
        .collection('carrinho')
        .get();

    List<ProdutoCarrinho> produtos = querySnapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      return ProdutoCarrinho.fromJson(data!);
    }).toList();

    return produtos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<ProdutoCarrinho>>(
      future: _getCarrinhoProdutos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<ProdutoCarrinho> produtos = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        produtos[index].imagem,
                        height: 80.0,
                        width: 80.0,
                      ),
                      title: Text(
                        produtos[index].nome,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produtos[index].categoria,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            'Valor unitário: ${produtos[index].valorUnit}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            'Quantidade: ${produtos[index].quantidade}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            'Valor total: ${produtos[index].valorTotal}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            deleteProduct(produtos[index]);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Total: ${produtos.fold(0.0, (previousValue, produto) => previousValue + produto.valorTotal)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }
      },
    ));
  }
}
