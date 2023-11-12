import 'package:flutter/material.dart';
import 'package:in_time/pages/home.dart';
import 'package:in_time/pages/carrinho.dart';
import 'package:in_time/pages/pedidos.dart';
import 'package:in_time/pages/perfil.dart';
import '../keys/navigator_keys.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  GlobalKey<NavigatorState> _currentNavigatorKey = homeNavigatorKey;
  int _selectedIndex = 0;
  int _selectedIconIndex = 0;
  final _pesquisaController = TextEditingController();
  List<Widget> _telas = [];

  @override
  void initState() {
    super.initState();
    _telas = [
      Home(filtro: _pesquisaController.text),
      Pedidos(),
      Perfil(),
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
    return WillPopScope(
        onWillPop: () async {
          if (!_currentNavigatorKey.currentState!.canPop()) {
            return false;
          }
          if (_currentNavigatorKey.currentState!.canPop()) {
            _currentNavigatorKey.currentState!.pop();
            return false;
          }
          return true;
        },
        child: Scaffold(
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
                      _onItemTapped(3);
                    },
                  ),
                ],
              ),
            ),
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: [
              Navigator(
                key: homeNavigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => Home(filtro: _pesquisaController.text),
                ),
              ),
              Navigator(
                key: pedidosNavigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => Pedidos(),
                ),
              ),
              Navigator(
                key: perfilNavigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => Perfil(),
                ),
              ),
              Navigator(
                key: carrinhoNavigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => Carrinho(),
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
            currentIndex: _selectedIconIndex,
            selectedItemColor: const Color.fromARGB(255, 252, 148, 0),
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int index) {
    _currentNavigatorKey.currentState!.popUntil((route) => route.isFirst);

    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
        if (index < 3) _selectedIconIndex = index;
        switch (index) {
          case 0:
            _currentNavigatorKey = homeNavigatorKey;
            break;
          case 1:
            _currentNavigatorKey = pedidosNavigatorKey;
            break;
          case 2:
            _currentNavigatorKey = perfilNavigatorKey;
            break;
          case 3:
            _currentNavigatorKey = carrinhoNavigatorKey;
            break;
        }
      });
    }
  }
}
