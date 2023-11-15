import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_time/pages/detalhesPedido.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  late Stream<QuerySnapshot> _pedidosStream;

  @override
  void initState() {
    super.initState();
    _pedidosStream = _getPedidosStream();
  }

  Stream<QuerySnapshot> _getPedidosStream() {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    return FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userId)
        .collection('pedido')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 25.0),
            child: Row(
              children: [
                Text(
                  "Pedidos",
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
            child: StreamBuilder<QuerySnapshot>(
              stream: _pedidosStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Erro ao carregar os pedidos');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Carregando os pedidos...');
                }

                List<Map<String, dynamic>> pedidos = snapshot.data!.docs
                    .map((doc) => doc.data() as Map<String, dynamic>)
                    .toList();
                if (pedidos.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nenhum pedido encontrado',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> pedido = snapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DetalhesPedido(pedido: pedido),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text('Pedido: ${pedido['id']}'),
                          subtitle: Text('Status: ${pedido['status']}'),
                        ),
                      ),
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
}
