import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:in_time/pages/produtoLoja.dart';
import '../classes/produto.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  String filtro;

  Home({Key? key, this.filtro = ''}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _categoriaSelecionada;
  bool homeContainer = true;
  bool produdosContainer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Visibility(
            visible: homeContainer,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    "O que você deseja?",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.filtro = '';
                          _categoriaSelecionada = 'maquiagem';
                          homeContainer = false;
                          produdosContainer = true;
                        });
                      },
                      child: Container(
                        width: 350,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 110, 27, 243),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Maquiagem",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Image.asset(
                                "images/blush.png",
                                height: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.filtro = '';
                          _categoriaSelecionada = 'Skincare';
                          homeContainer = false;
                          produdosContainer = true;
                        });
                      },
                      child: Container(
                        width: 350,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 110, 27, 243),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Skin care",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Image.asset(
                                "images/skin.png",
                                height: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.filtro = '';
                          _categoriaSelecionada = 'perfumaria';
                          homeContainer = false;
                          produdosContainer = true;
                        });
                      },
                      child: Container(
                        width: 350,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 110, 27, 243),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Perfumaria",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Image.asset(
                                "images/perfume.png",
                                height: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !homeContainer,
            child: Expanded(
              child: FutureBuilder<List<Produto>>(
                future: _getProdutos(
                    widget.filtro != '' ? 'nome' : 'categoria',
                    widget.filtro != ''
                        ? widget.filtro
                        : _categoriaSelecionada ?? ''),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Produto>> snapshot) {
                  if (snapshot.hasError) {
                    return const Text(
                      'Erro ao carregar os produtos',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    );
                  }

                  if (homeContainer) {
                    homeContainer = false;
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Column(
                        children: [
                          Text(
                            "Carregando os produdos...",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                          CircularProgressIndicator(
                            color: Color.fromARGB(255, 110, 27, 243),
                          ),
                        ],
                      ),
                    );
                  }

                  List<Produto> produtos = snapshot.data ?? [];
                  if (produtos.isEmpty) {
                    return const Text(
                      'Nenhum produto encontrado',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Produto produto = snapshot.data![index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ProdutoLoja(selectedProduct: produto)));
                          },
                          leading: Image.network(
                            produto.imagem,
                            height: 80.0,
                            width: 80.0,
                          ),
                          title: Text(
                            produto.nome,
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            produto.categoria,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          trailing: Text(
                            'R\$ ${produto.valor.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Produto>> _getProdutos(
    String filtroTipo,
    String filtroValor,
  ) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('produtos').get();
    List<Produto> produtos = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        Produto produto = Produto.fromJson(data);
        produtos.add(produto);
      }
    }
    if (filtroTipo == 'categoria' && filtroValor.isNotEmpty) {
      produtos = produtos
          .where((produto) => produto.categoria
              .toLowerCase()
              .contains(filtroValor.toLowerCase()))
          .toList();
    } else if (filtroTipo == 'nome' && filtroValor.isNotEmpty) {
      produtos = produtos
          .where((produto) =>
              produto.nome.toLowerCase().contains(filtroValor.toLowerCase()))
          .toList();
    }
    return produtos;
  }
}
