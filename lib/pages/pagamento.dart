import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_time/classes/endereco.dart';
import 'package:in_time/pages/sucesso.dart';

class Pagamento extends StatefulWidget {
  final Endereco endereco;

  const Pagamento({Key? key, required this.endereco}) : super(key: key);

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  String? selectedPayment = 'cartao';

  Future<void> criarPedido(Endereco endereco) async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    // Obter os produtos do carrinho
    QuerySnapshot carrinhoSnapshot = await _db
        .collection('usuarios')
        .doc(userId)
        .collection('carrinho')
        .get();
    List<Map<String, dynamic>> produtos = carrinhoSnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    // Criar o pedido
    await _db.collection('usuarios').doc(userId).collection('pedido').add({
      'id':
          _db.collection('usuarios').doc().id, // Gera um novo ID para o pedido
      'endereco': endereco.toJson(), // Converte o objeto Endereco para um Map
      'data': Timestamp.now(), // Data e hora atuais
      'status': 'aguardando pagamento',
      'produtos': produtos, // Array de produtos
      'formaPagamento': selectedPayment,
    });

    // Esvaziar o carrinho
    for (var doc in carrinhoSnapshot.docs) {
      await _db
          .collection('usuarios')
          .doc(userId)
          .collection('carrinho')
          .doc(doc.id)
          .delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 110, 27, 243),
          titleSpacing: 0.0,
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Colors.white),
              ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200.0),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 25.0),
            child: Row(
              children: [
                Text(
                  "Pagamentos",
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: const Text('Cartão de Crédito'),
                      leading: Radio<String>(
                        value: 'cartao',
                        groupValue: selectedPayment,
                        onChanged: (String? value) {
                          setState(() {
                            selectedPayment = value;
                          });
                        },
                        activeColor: Color.fromARGB(255, 110, 27, 243),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: const Text('Pix'),
                      leading: Radio<String>(
                          value: 'pix',
                          groupValue: selectedPayment,
                          onChanged: (String? value) {
                            setState(() {
                              selectedPayment = value;
                            });
                          },
                          activeColor: Color.fromARGB(255, 110, 27, 243)),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: const Text('Boleto Bancário'),
                      leading: Radio<String>(
                          value: 'boleto',
                          groupValue: selectedPayment,
                          onChanged: (String? value) {
                            setState(() {
                              selectedPayment = value;
                            });
                          },
                          activeColor: Color.fromARGB(255, 110, 27, 243)),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 250.0, bottom: 20.0),
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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Confirmação"),
                              content: const Text(
                                  "Certeza que deseja efetuar a compra? Uma vez realizada não poderá editá-la."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    criarPedido(widget.endereco);
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Sucesso(),
                                      ),
                                    );
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
                      child: const Text(
                        "Finalizar compra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 110, 27, 243)),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
