import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  });
                },
                child: Container(
                  width: 350,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 21, 161),
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
                    _categoriaSelecionada = 'skin care';
                  });
                },
                child: Container(
                  width: 350,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 21, 161),
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
                  });
                },
                child: Container(
                  width: 350,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 21, 161),
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
          Expanded(
            child: FutureBuilder<List<Produto>>(
              future: _getProdutos(
                  widget.filtro != '' ? 'nome' : 'categoria',
                  widget.filtro != ''
                      ? widget.filtro
                      : _categoriaSelecionada ?? ''),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Produto>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Erro ao carregar os produtos');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Carregando os produtos...');
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Produto produto = snapshot.data![index];
                    return ListTile(
                      leading: Image.network(produto.imagem),
                      title: Text(produto.nome),
                      subtitle: Text(produto.categoria),
                      trailing: Text(
                          '${produto.quantidade} unidades - R\$ ${produto.valor.toStringAsFixed(2)}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Produto>> _getProdutos(
      String filtroTipo, String filtroValor) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('produtos').get();
    List<Produto> produtos = querySnapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      return Produto.fromJson(data!);
    }).toList();

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
