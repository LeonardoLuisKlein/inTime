import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              "O que você deseja?",
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      print("paulo");
                    },
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 100, 21, 161),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Maquiagem",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              "images/blush.png",
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                    )),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      print("paulo");
                    },
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 100, 21, 161),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Skin care",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Image.asset(
                              "images/skin.png",
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                    )),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 100, 21, 161),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Perfumaria",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              "images/perfume.png",
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
