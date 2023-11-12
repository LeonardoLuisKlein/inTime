import 'package:flutter/material.dart';

class DetalhesPedido extends StatefulWidget {
  final Map<String, dynamic> pedido;
  DetalhesPedido({required this.pedido});

  @override
  State<DetalhesPedido> createState() => _DetalhesPedidoState();
}

class _DetalhesPedidoState extends State<DetalhesPedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Endereço: ${widget.pedido['endereco']['endereco']}'),
            Text(
                'Data: ${widget.pedido['data'].toDate().toString().split(' ')[0]}'),
            Text('Método de pagamento: ${widget.pedido['formaPagamento']}'),
            Text('Status: ${widget.pedido['status']}'),
            Text('Produtos:'),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
