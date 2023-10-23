import "package:flutter/material.dart";
import "package:in_time/pages/enderecosPrincipal.dart";
import "package:in_time/services/auth_services.dart";
import "package:provider/provider.dart";

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundImage: AssetImage('images/user.png'),
                ),
              ),
              Text(
                "Nomansky",
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: GestureDetector(
            onTap: () {
              print("Pauleen");
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
            print("Pauleen");
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
                      Icons.wallet,
                      color: Colors.black,
                      size: 45.0,
                    )),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text("Pagamentos",
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
            print("Pauleen");
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
            context.read<AuthService>().logout();
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
    );
  }
}
