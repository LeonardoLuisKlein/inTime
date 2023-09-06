import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var _logo = const AssetImage("images/logoInTime.png");

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
                "Faça o login abaixo",
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
                  child: // Espaçamento entre a label e o campo
                      TextField(
                    style: const TextStyle(
                      // Ajuste de estilo do texto dentro do campo
                      fontSize: 24.0,
                      fontFamily: 'Montserrat', // Aumenta a fonte
                      color: Colors.white, // Define a cor do texto como branca
                    ),
                    decoration: InputDecoration(
                      filled: true, // Preenchimento ativado
                      fillColor: const Color(0xFF4C0D7C),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Borda arredondada
                      ),
                    ),
                    keyboardType: TextInputType
                        .emailAddress, // Define o teclado como o de email
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
                      // Ajuste de estilo do texto dentro do campo
                      fontSize: 24.0,
                      fontFamily: 'Montserrat', // Aumenta a fonte
                      color: Colors.white, // Define a cor do texto como branca
                    ),
                    decoration: InputDecoration(
                      filled: true, // Preenchimento ativado
                      fillColor: const Color(0xFF4C0D7C),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Borda arredondada
                      ),
                    ),
                    keyboardType: TextInputType
                        .visiblePassword, // Define o teclado como o de email
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Esqueceu sua senha?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
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
                      "Login",
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ))),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                    onTap: () {},
                    child: const Text("Ainda não possui conta? Cadastre-se",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 255, 255, 255))))),
          ]),
        )),
      ),
    );
  }
}
