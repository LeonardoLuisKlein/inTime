import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_time/classes/endereco.dart';
import 'package:in_time/pages/enderecos.dart';
import 'package:in_time/pages/pedidos.dart';
import 'package:in_time/pages/perfil.dart';
import 'package:in_time/pages/principal.dart';

class EnderecosPrincipal extends StatefulWidget {
  final bool isSelecting;

  const EnderecosPrincipal({Key? key, this.isSelecting = false})
      : super(key: key);

  @override
  State<EnderecosPrincipal> createState() => _EnderecosPrincipalState();
}

class _EnderecosPrincipalState extends State<EnderecosPrincipal> {
  int _selectedIndex = 1;
  String? _selectedAddressId;

  Future<List<Endereco>> _getEnderecos() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    if (userId == null) {
      // Nenhum usuário está autenticado.
      return [];
    }

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userId)
        .collection('endereco')
        .get();

    List<Endereco> enderecos = querySnapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      return Endereco.fromJson(data!);
    }).toList();
    return enderecos;
  }

  deleteEndereco(Endereco endereco) async {
    {
      final User? user = FirebaseAuth.instance.currentUser;
      final String? userId = user?.uid;

      if (userId != null) {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userId)
            .collection('carrinho')
            .doc(endereco.id)
            .delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double alturaDispositivo = MediaQuery.of(context).size.height * 0.7;
    print(_selectedAddressId);

    return Scaffold(
        body: FutureBuilder<List<Endereco>>(
      future: _getEnderecos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Endereco> enderecos = snapshot.data!;
          return ListView.builder(
            itemCount: enderecos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(enderecos[index].endereco),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteEndereco(enderecos[index]);
                      },
                    ),
                    if (widget.isSelecting)
                      Radio<String>(
                        value: enderecos[index].id,
                        groupValue: _selectedAddressId,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedAddressId = value;
                          });
                        },
                      ),
                  ],
                ),
              );
            },
          );
        }
      },
    )

        /*appBar: PreferredSize(
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
                  Scaffold(
                      body: FutureBuilder<List<Endereco>>(
                    future: _getEnderecos(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<Endereco> enderecos = snapshot.data!;
                        return ListView.builder(
                          itemCount: enderecos.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(enderecos[index].endereco),
                              // Adicione mais campos conforme necessário.
                            );
                          },
                        );
                      }
                    },
                  )),
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
      ),*/
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
