import 'package:flutter/material.dart';
import 'package:in_time/pages/home.dart';

class Sucesso extends StatefulWidget {
  const Sucesso({super.key});

  @override
  State<Sucesso> createState() => _SucessoState();
}

class _SucessoState extends State<Sucesso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Padding(
        padding: EdgeInsets.only(top: 20.0, left: 25.0),
        child: Row(
          children: [
            Text(
              "Sucesso",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: 0.5,
          color: Colors.black,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Text(
          "Obrigado por confiar na In Time, seu pedido foi confirmado! Aguarde a entrega do mesmo",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 250.0, bottom: 20.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                fixedSize: const Size(275.0, 60.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 110, 27, 243),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: const Text(
                "Voltar para o inicio",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 110, 27, 243)),
              ))),
    ]));
  }
}
