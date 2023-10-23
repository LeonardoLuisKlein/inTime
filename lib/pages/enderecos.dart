import 'package:flutter/material.dart';
import 'package:in_time/pages/pedidos.dart';
import 'package:in_time/pages/perfil.dart';
import 'package:in_time/pages/principal.dart';

class Enderecos extends StatefulWidget {
  const Enderecos({super.key});

  @override
  State<Enderecos> createState() => _EnderecosState();
}

class _EnderecosState extends State<Enderecos> {
  int _selectedIndex = 1;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SizedBox(
                      height: 50.0,
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Nome completo',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 76, 13, 124)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorStyle: const TextStyle(
                              color: Color.fromARGB(255, 252, 148, 0),
                              fontSize: 14.0,
                              fontFamily: 'Montserrat'),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SizedBox(
                      height: 50.0,
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Telefone',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 76, 13, 124)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorStyle: const TextStyle(
                              color: Color.fromARGB(255, 252, 148, 0),
                              fontSize: 14.0,
                              fontFamily: 'Montserrat'),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SizedBox(
                      height: 50.0,
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        decoration: InputDecoration(
                          labelText: 'CPF',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 76, 13, 124)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorStyle: const TextStyle(
                              color: Color.fromARGB(255, 252, 148, 0),
                              fontSize: 14.0,
                              fontFamily: 'Montserrat'),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    )),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: SizedBox(
                            height: 50.0,
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              decoration: InputDecoration(
                                labelText: 'CEP',
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 76, 13, 124)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 252, 148, 0)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 252, 148, 0)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorStyle: const TextStyle(
                                    color: Color.fromARGB(255, 252, 148, 0),
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat'),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: SizedBox(
                            height: 50.0,
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              decoration: InputDecoration(
                                labelText: 'Bairro',
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 76, 13, 124)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 252, 148, 0)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 252, 148, 0)),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorStyle: const TextStyle(
                                    color: Color.fromARGB(255, 252, 148, 0),
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat'),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SizedBox(
                      height: 50.0,
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Endereço',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 76, 13, 124)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 148, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorStyle: const TextStyle(
                              color: Color.fromARGB(255, 252, 148, 0),
                              fontSize: 14.0,
                              fontFamily: 'Montserrat'),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 110, 27, 243),
                              elevation: 0,
                              fixedSize: const Size(300.0, 60.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ))),
                ),
              ],
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
