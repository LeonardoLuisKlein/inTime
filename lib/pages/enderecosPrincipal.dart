import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_time/classes/endereco.dart';
import 'package:in_time/pages/enderecos.dart';
import 'package:in_time/pages/pagamento.dart';

class EnderecosPrincipal extends StatefulWidget {
  final bool isSelecting;

  const EnderecosPrincipal({Key? key, this.isSelecting = false})
      : super(key: key);

  @override
  State<EnderecosPrincipal> createState() => _EnderecosPrincipalState();
}

class _EnderecosPrincipalState extends State<EnderecosPrincipal> {
  Endereco? _selectedEndereco;

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
            .collection('endereco')
            .doc(endereco.id)
            .delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: Scaffold(
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
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                            title: Text(
                              enderecos[index].endereco,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 110, 27, 243),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Confirmação"),
                                            content: const Text(
                                                "Certeza que deseja remover este endereço?"),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  await deleteEndereco(
                                                      enderecos[index]);
                                                  setState(() {
                                                    _selectedEndereco = null;

                                                    enderecos.removeAt(index);
                                                  });
                                                  Navigator.of(context).pop();
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
                                    });
                                  },
                                ),
                                if (widget.isSelecting)
                                  Radio<String>(
                                      value: enderecos[index].id,
                                      groupValue: _selectedEndereco?.id,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedEndereco =
                                              enderecos.firstWhere((endereco) =>
                                                  endereco.id == value);
                                        });
                                      },
                                      activeColor: const Color.fromARGB(
                                          255, 110, 27, 243)),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  fixedSize: const Size(275.0, 55.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 110, 27, 243),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Enderecos(),
                    ),
                  );
                },
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 110, 27, 243),
                  ),
                ),
              ),
            ),
          ),
          if (widget.isSelecting && _selectedEndereco != null)
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Pagamento(
                              endereco: _selectedEndereco!,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Prosseguir para pagamento",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 110, 27, 243),
                        ),
                      ))),
            ),
        ],
      ),
    );
  }
}
