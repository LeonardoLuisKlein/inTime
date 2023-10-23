import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    final _logo = const AssetImage("images/logoBranco.png");
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(top: 20.0, left: 25.0),
        child: Text(
          "Sobre",
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
      const Center(
        child: Column(
          children: [
            Text(
                "Bem-vindo ao In Time, o seu destino online para beleza e maquiagem! Nossa missão é ajudá-lo a realçar sua beleza natural e expressar sua criatividade, tudo isso no momento certo. No In Time, acreditamos que a maquiagem é mais do que apenas cores e produtos; é uma forma de arte e autoexpressão.\n\nCom uma vasta seleção de produtos de maquiagem de alta qualidade, desde bases luxuosas até sombras vibrantes e batons deslumbrantes, temos tudo o que você precisa para criar o visual perfeito, esteja você se preparando para um evento especial ou apenas querendo se mimar no dia a dia.\n\nNossa plataforma de compras online é fácil de usar e intuitiva, tornando a sua jornada de compra rápida e conveniente. Além disso, oferecemos entrega rápida e atendimento ao cliente excepcional para garantir que você tenha a melhor experiência de compra possível.\n\nNo In Time, acreditamos que a beleza está no tempo certo, e estamos aqui para ajudar você a alcançar essa beleza a qualquer momento, onde quer que você esteja. Explore nossa coleção de maquiagens de alta qualidade e descubra o seu potencial de beleza hoje mesmo!\n\nSeja bem-vindo ao In Time - onde a sua beleza está sempre na hora certa.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                )),
            Text("In time - direitos reservados 2023",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      )
    ]));
  }
}
