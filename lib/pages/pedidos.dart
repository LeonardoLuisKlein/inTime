import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../classes/produto.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  late Future<List<QueryDocumentSnapshot>> _pedidos;

  @override
  void initState() {
    super.initState();
    _pedidos = _getPedidos();
  }

  Future<List<QueryDocumentSnapshot>> _getPedidos() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userId)
        .collection('pedido')
        .get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: _pedidos,
        builder: (BuildContext context,
            AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
          if (snapshot.hasError) {
            return Text('Erro ao carregar os pedidos');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Carregando os pedidos...');
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> pedido =
                  snapshot.data![index].data() as Map<String, dynamic>;
              return ListTile(
                title: Text('Pedido: ${pedido['id']}'),
                subtitle: Text('Status: ${pedido['status']}'),
              );
            },
          );
        },
      ),
    );
  }
}
