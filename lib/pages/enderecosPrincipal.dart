import 'package:flutter/material.dart';
import 'package:in_time/pages/enderecos.dart';
import 'package:in_time/pages/pedidos.dart';
import 'package:in_time/pages/perfil.dart';
import 'package:in_time/pages/principal.dart';

class EnderecosPrincipal extends StatefulWidget {
  const EnderecosPrincipal({super.key});

  @override
  State<EnderecosPrincipal> createState() => _EnderecosPrincipalState();
}

class _EnderecosPrincipalState extends State<EnderecosPrincipal> {
  int _selectedIndex = 1;
  int _numEnderecos = 0;
  @override
  Widget build(BuildContext context) {
    double alturaDispositivo = MediaQuery.of(context).size.height * 0.7;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 25.0),
            child: Text(
              "Endereços",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              height: 0.5,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: alturaDispositivo,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (_numEnderecos == 0)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Parece que você ainda não possui endereços salvos.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  GestureDetector(
                      onTap: () {
                        print("paulo");
                      },
                      child: Container(
                          width: 350,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 100, 21, 161),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Endereco tal tal",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'Montserrat',
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: const Text(
                                        "X",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: 'Montserrat',
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Text(
                                "99725-000",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              const Text(
                                "Três Arroios - RS",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )
                            ],
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 110, 27, 243),
                              elevation: 0,
                              fixedSize: const Size(300.0, 60.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Enderecos()),
                            );
                          },
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 35.0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          fontFamily: 'Montserrat',
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14.0,
          fontFamily: 'Montserrat',
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 252, 148, 0),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Principal()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Pedidos()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Perfil()),
        );
        break;
    }
  }
}
