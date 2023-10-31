import 'package:flutter/material.dart';
import 'package:in_time/pages/home.dart';
import 'package:in_time/pages/carrinho.dart';
import 'package:in_time/pages/pedidos.dart';
import 'package:in_time/pages/perfil.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _selectedIndex = 0;
  final _pesquisaController = TextEditingController();
  List<Widget> _telas = [];

  @override
  void initState() {
    super.initState();
    _telas = [
      Home(filtro: _pesquisaController.text),
      const Pedidos(),
      const Perfil(),
    ];
    _pesquisaController.addListener(_onPesquisaControllerChanged);
  }

  @override
  void dispose() {
    _pesquisaController.removeListener(_onPesquisaControllerChanged);
    _pesquisaController.dispose();
    super.dispose();
  }

  void _onPesquisaControllerChanged() {
    setState(() {
      _telas[0] = Home(filtro: _pesquisaController.text);
    });
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
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200.0),
                  child: TextField(
                    controller: _pesquisaController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Carrinho()));
                },
              ),
            ],
          ),
        ),
      ),
      body: _telas[_selectedIndex],
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
  }
}
