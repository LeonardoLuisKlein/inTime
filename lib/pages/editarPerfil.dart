import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  final nameController = TextEditingController();
  final telefoneController = MaskedTextController(mask: '(00)00000-0000');
  final dataNascController = MaskedTextController(mask: '00/00/0000');

  Future<void> sendData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;

    if (userId == null) {
      // Usuário não autenticado
      return;
    }

    // Dados a serem adicionados ou atualizados
    Map<String, dynamic> dados = {
      'nome': nameController.text,
      'telefone': telefoneController.text,
      'dataNasc': dataNascController.text,
    };

    final DocumentReference<Map<String, dynamic>> userDocRef =
        FirebaseFirestore.instance.collection('usuarios').doc(userId);

    await userDocRef.set(dados, SetOptions(merge: true));
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
                "Editar perfil",
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
                          controller: nameController,
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
                          keyboardType: TextInputType.phone,
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
                                controller: dataNascController,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Data Nasc',
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
                                keyboardType: TextInputType.datetime,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Sucesso!"),
                                content: const Text(
                                    "Seu perfil foi editado com sucesso!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      sendData();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Editar perfil",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 110, 27, 243),
                          ),
                        ),
                      ),
                    ),
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
