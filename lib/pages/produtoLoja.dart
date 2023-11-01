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
  List<int> quantities = [1, 2, 3, 4, 5];
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black, // Cor da borda inferior
                      width: 0.5, // Largura da borda inferior
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
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 110, 27, 243),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Quantidade:',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: DropdownButton<int>(
                            value: selectedQuantity,
                            items: quantities.map((int quantity) {
                              return DropdownMenuItem<int>(
                                value: quantity,
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Montserrat',
                                    color:
                                        Colors.black, // Cor do texto na lista
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
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat',
                                      color: Colors
                                          .white, // Cor do texto quando a lista está fechada
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 110, 27, 243),
                          elevation: 0,
                          fixedSize: const Size(300.0, 80.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
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
                            fontSize: 30,
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
