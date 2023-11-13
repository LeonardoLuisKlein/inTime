import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetalhesPedido extends StatefulWidget {
  final Map<String, dynamic> pedido;
  DetalhesPedido({required this.pedido});

  @override
  State<DetalhesPedido> createState() => _DetalhesPedidoState();
}

class _DetalhesPedidoState extends State<DetalhesPedido> {
  late DateTime dataDoPedido;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    dataDoPedido = widget.pedido['data'].toDate();
    formattedDate = DateFormat('dd/MM/yyyy').format(dataDoPedido);
  }

  double calcularValorTotal() {
    double valorTotal = 0.0;

    for (var produto in widget.pedido['produtos']) {
      valorTotal += produto['valorTotal'];
    }

    return valorTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 25.0),
            child: Text(
              'Pedido id: ${widget.pedido['id'].substring(0, 5)}...',
              textAlign: TextAlign.left,
              style: const TextStyle(
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
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Endereço: ${widget.pedido['endereco']['endereco']}',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Data: $formattedDate',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Método de pagamento: ${widget.pedido['formaPagamento']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  )),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Status: ${widget.pedido['status']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  )),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Produtos:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  )),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListView.builder(
                itemCount: widget.pedido['produtos'].length,
                itemBuilder: (context, index) {
                  var produto = widget.pedido['produtos'][index];
                  return ListTile(
                    leading: Image.network(produto['imagem']),
                    title: Text(produto['nome']),
                    subtitle: Text(
                        'Quantidade: ${produto['quantidade']}, Valor Unit: ${produto['valorUnit']}, Valor Total: ${produto['valorTotal']}'),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Valor Total: R\$ ${calcularValorTotal()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
