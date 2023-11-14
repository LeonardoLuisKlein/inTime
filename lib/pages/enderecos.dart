import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class Enderecos extends StatefulWidget {
  const Enderecos({super.key});

  @override
  State<Enderecos> createState() => _EnderecosState();
}

class _EnderecosState extends State<Enderecos> {
  final nomeController = TextEditingController();
  final telefoneController = MaskedTextController(mask: '(00)00000-0000');
  final cpfController = MaskedTextController(mask: '000.000.000-00');
  final cepController = MaskedTextController(mask: '00000-000');
  final bairroController = TextEditingController();
  final enderecoController = TextEditingController();

  void _onButtonPressed() {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentReference docRef =
        db.collection('usuarios').doc(userId).collection('endereco').doc();

    Map<String, dynamic> dadosEndereco = {
      'id': docRef.id,
      'nome': nomeController.text,
      'telefone': telefoneController.text,
      'cpf': cpfController.text,
      'cep': cepController.text,
      'bairro': bairroController.text,
      'endereco': enderecoController.text,
    };

    docRef.set(dadosEndereco);
  }

  @override
  Widget build(BuildContext context) {
    double alturaDispositivo = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                          controller: nomeController,
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
                          controller: telefoneController,
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
                          controller: cpfController,
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
                                controller: cepController,
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
                                        color:
                                            Color.fromARGB(255, 76, 13, 124)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 252, 148, 0)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 252, 148, 0)),
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
                                controller: bairroController,
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
                                        color:
                                            Color.fromARGB(255, 76, 13, 124)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 252, 148, 0)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 252, 148, 0)),
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
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: SizedBox(
                        height: 50.0,
                        child: TextFormField(
                          controller: enderecoController,
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
                          keyboardType: TextInputType.text,
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
                            onPressed: () {
                              _onButtonPressed();
                            },
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
      ),
    );
  }
}
