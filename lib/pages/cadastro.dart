import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    var _logo = const AssetImage("images/logoInTime.png");
    bool _termsAccepted = true;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 100, 21, 161),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image(
                image: _logo,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 30.0),
              child: Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nome',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: SizedBox(
                  height: 55.0,
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF4C0D7C),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: SizedBox(
                  height: 55.0,
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF4C0D7C),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CPF',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: SizedBox(
                  height: 55.0,
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF4C0D7C),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 13.00),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Senha',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: SizedBox(
                  height: 55.0,
                  child: // Espaçamento entre a label e o campo
                      TextField(
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF4C0D7C),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 13.00),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirmar senha',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: SizedBox(
                  height: 55.0,
                  child: TextField(
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF4C0D7C),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 101, 43),
                        elevation: 0,
                        fixedSize: const Size(300.0, 60.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {},
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ))),
          ]),
        )),
      ),
    );
  }
}
