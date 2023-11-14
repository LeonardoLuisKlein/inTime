import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:in_time/pages/editarPerfil.dart";
import "package:in_time/pages/enderecosPrincipal.dart";
import "package:in_time/pages/sobre.dart";
import "package:in_time/services/auth_services.dart";
import "package:provider/provider.dart";
import '../keys/navigator_keys.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  Future<Object> _getUsuario() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;
    if (userId == null) {
      return "";
    }

    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentSnapshot snapshot =
        await db.collection("usuarios").doc(userId).get();

    Map<String, dynamic>? dados = snapshot.data() as Map<String, dynamic>?;

    return dados?["nome"];
  }

  @override
  void initState() {
    super.initState();
    var user = _getUsuario();
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (perfilNavigatorKey.currentState!.canPop()) {
            perfilNavigatorKey.currentState!.pop();
            return false;
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      backgroundImage: AssetImage('images/user.png'),
                    ),
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('usuarios')
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return const Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Text(
                          "${data['nome']}",
                          style: const TextStyle(
                              fontSize: 32,
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 0, 0, 0)),
                        );
                      }

                      return const CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditarPerfil(),
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.black),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 45.0,
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text("Editar Perfil",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EnderecosPrincipal(),
                  ),
                );
              },
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.black),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.black,
                          size: 45.0,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text("Endereços",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Sobre(),
                  ),
                );
              },
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.black),
                    bottom: BorderSide(width: 0.3, color: Colors.black),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(
                          Icons.mobile_friendly,
                          color: Colors.black,
                          size: 45.0,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text("Sobre",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Confirmação"),
                      content: const Text(
                          "Certeza que deseja fazer o logout? Você precisará fazer o login novamente"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<AuthService>().logout();
                          },
                          child: const Text("Sim"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Não"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.black),
                    bottom: BorderSide(width: 0.3, color: Colors.black),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.logout,
                          color: Colors.black,
                          size: 45.0,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text("Logout",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
