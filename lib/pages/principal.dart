import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _selectedIndex = 0; // Índice inicial selecionado

  final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text("Aaaaa")), // Conteúdo para cada ícone
    const Center(child: Text("Pedidos")), // Conteúdo para "Pedidos"
    const Center(child: Text("Perfil")), // Conteúdo para "Perfil"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 100, 21, 161),
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
      body: const Center(
        child: Text("Aaaaa"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold, // Define a espessura da fonte
          fontSize: 16.0, // Define o tamanho da fonte
          fontFamily: 'Montserrat', // Define a família da fonte (se aplicável)
          color: Colors.blue, // Define a cor do texto selecionado
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal, // Define a espessura da fonte
          fontSize: 14.0, // Define o tamanho da fonte
          fontFamily: 'Montserrat', // Define a família da fonte (se aplicável)
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
        selectedItemColor: const Color.fromARGB(255, 255, 101, 43),
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
