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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                  widget.selectedProduct.imagem,
                  width: 500, // Defina a largura desejada
                  height: 450,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Text('Opções:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 30.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 110, 27, 243),
                          elevation: 0,
                          fixedSize: const Size(70.0, 30.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: const Text(
                        "A",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 30.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 252, 148, 0),
                          elevation: 0,
                          fixedSize: const Size(70.0, 30.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: const Text(
                        "B",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 30.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 110, 27, 243),
                          elevation: 0,
                          fixedSize: const Size(70.0, 30.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: const Text(
                        "C",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                )
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
                      onPressed: () {},
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
