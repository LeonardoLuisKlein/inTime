import 'package:flutter/material.dart';
import 'package:in_time/pages/pedidos.dart';
import 'package:in_time/pages/perfil.dart';
import 'package:in_time/services/auth_services.dart';
import 'package:provider/provider.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _selectedIndex = 0;
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
                      print("paulo");
                    },
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 100, 21, 161),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Maquiagem",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255))),
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
                    )),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      print("paulo");
                    },
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 100, 21, 161),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Skin care",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255))),
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
                    )),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: GestureDetector(
                    onTap: () => context.read<AuthService>().logout(),
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 100, 21, 161),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Perfumaria",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255))),
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
                    )),
              )),
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
