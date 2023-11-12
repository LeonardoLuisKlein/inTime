import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../classes/produto.dart';

// ignore: must_be_immutable
class ProdutoLoja extends StatefulWidget {
  Produto selectedProduct;
  ProdutoLoja({Key? key, required this.selectedProduct}) : super(key: key);

  @override
  State<ProdutoLoja> createState() => _ProdutoLojaState();
}

class _ProdutoLojaState extends State<ProdutoLoja> {
  int selectedQuantity = 1;

  void _onButtonPressed() {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentReference docRef =
        db.collection('usuarios').doc(userId).collection('carrinho').doc();

    Map<String, dynamic> dadosCarrinho = {
      'id': docRef.id,
      'nome': widget.selectedProduct.nome,
      'categoria': widget.selectedProduct.categoria,
      'imagem': widget.selectedProduct.imagem,
      'quantidade': selectedQuantity,
      'valorUnit': widget.selectedProduct.valor,
      'valorTotal': widget.selectedProduct.valor * selectedQuantity
    };

    docRef.set(dadosCarrinho);
  }

  @override
  Widget build(BuildContext context) {
    List<int> quantities =
        List<int>.generate(widget.selectedProduct.quantidade, (i) => i + 1);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Image.network(
                  widget.selectedProduct.imagem,
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(widget.selectedProduct.nome,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Text('R\$ ${widget.selectedProduct.valor}',
                      style: const TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 225,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white, // Alterado para branco
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 110, 27, 243), // Cor da borda ajustada
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Quantidade:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 110, 27, 243),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                          child: DropdownButton<int>(
                            value: selectedQuantity,
                            items: quantities.map((int quantity) {
                              return DropdownMenuItem<int>(
                                value: quantity,
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedQuantity = newValue;
                                });
                              }
                            },
                            selectedItemBuilder: (BuildContext context) {
                              return quantities.map<Widget>((int quantity) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontSize: 16.0, // Fonte um pouco menor
                                      fontFamily: 'Montserrat',
                                      color: const Color.fromARGB(
                                          255, 110, 27, 243),
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Padding(
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
                      _onButtonPressed();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Sucesso!"),
                            content: const Text(
                                "Seu produto foi adicionado ao carrinho."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Adicionar ao carrinho",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 110, 27, 243),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
