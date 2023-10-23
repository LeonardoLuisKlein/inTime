import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../classes/produto.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  late Future<List<Produto>> _produtos;

  @override
  void initState() {
    super.initState();
    _produtos = _getProdutos();
  }

  Future<List<Produto>> _getProdutos() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('produtos').get();
    List<Produto> produtos = querySnapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      return Produto.fromJson(data!);
    }).toList();
    return produtos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Produto>>(
        future: _produtos,
        builder: (BuildContext context, AsyncSnapshot<List<Produto>> snapshot) {
          print(snapshot);
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
                subtitle: Text(produto.opcoes.join(', ')),
                trailing: Text('${produto.quantidade} unidades'),
              );
            },
          );
        },
      ),
    );
  }
}
