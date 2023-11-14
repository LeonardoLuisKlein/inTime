import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_time/classes/produtoCarrinho.dart';
import 'package:in_time/pages/enderecosPrincipal.dart';

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

          if (produtos.isEmpty) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 25.0),
                  child: Row(
                    children: [
                      Text(
                        "Carrinho",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 0.5,
                    color: Colors.black,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Nenhum produto no carrinho, vá às compras!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 25.0),
                child: Row(
                  children: [
                    Text(
                      "Carrinho",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 0.5,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            produtos[index].imagem,
                            height: 80.0,
                            width: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          produtos[index].nome,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              produtos[index].categoria,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Valor unitário: ${produtos[index].valorUnit}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Quantidade: ${produtos[index].quantidade}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Valor total: ${produtos[index].valorTotal}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Confirmação"),
                                  content: const Text(
                                      "Certeza que deseja remover o produto do carrinho"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          deleteProduct(produtos[index]);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Sim"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Não"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  width: 350,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 100, 21, 161),
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Dados finais da compra",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 100, 21, 161)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Quantidade de produtos: ${produtos.length}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 100, 21, 161)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Valor total: ${produtos.fold(0.0, (previousValue, produto) => previousValue + produto.valorTotal)}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 100, 21, 161)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              if (produtos.length != 0)
                Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          fixedSize: const Size(275.0, 60.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 110, 27, 243),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EnderecosPrincipal(
                                isSelecting: true,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Prosseguir para endereço",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 110, 27, 243)),
                        ))),
            ],
          );
        }
      },
    ));
  }
}
