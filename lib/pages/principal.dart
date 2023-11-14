import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<int> _getCarrinhoQuantidade() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;
    if (userId == null) {
      return 0;
    }

    FirebaseFirestore db = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await db
        .collection("usuarios")
        .doc(userId)
        .collection("carrinho")
        .get();

    return querySnapshot.size;
  }

  int _carrinhoQuantidade = 0;

  void _atualizarQuantidadeCarrinho() {
    _getCarrinhoQuantidade().then((quantidadeProdutos) {
      setState(() {
        _carrinhoQuantidade = quantidadeProdutos;
      });
    });
  }

  @override
  void initState() {
    _atualizarQuantidadeCarrinho();
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
      _atualizarQuantidadeCarrinho();
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
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(Icons.search),
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
                    icon: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Icon(Icons.shopping_cart),
                        if (_carrinhoQuantidade > 0)
                          Positioned(
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10.0, left: 20.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 252, 148, 0),
                                radius: 10,
                                child: Text(
                                  _carrinhoQuantidade.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    onPressed: () {
                      _onItemTapped(3);
                    },
                  )
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
                  builder: (context) => const Pedidos(),
                ),
              ),
              Navigator(
                key: perfilNavigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => const Perfil(),
                ),
              ),
              Navigator(
                key: carrinhoNavigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => const Carrinho(),
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
