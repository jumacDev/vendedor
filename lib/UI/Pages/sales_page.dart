import 'package:flutter/material.dart';
import '../../MODELS/sale_model.dart';

class SalesPage extends StatefulWidget {
  final List<Sale> saleslist;
  const SalesPage({Key? key, required this.saleslist}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: buildSalesList()
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: const Text(
        'Lista de Números de Hoy',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  buildSalesList() {
    return ListView.builder(
        padding: const EdgeInsets.all(11),
        itemCount: widget.saleslist.length * 2 ,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(color: Colors.black,);
          /*2*/
          int index = i ~/ 2; /*3*/
          return _buildRow(widget.saleslist[index]);
        });
  }

  _buildRow(Sale sale) {
    return ListTile(
        title: Text(
          'Número: ${sale.numbersale}',
          style: const TextStyle(fontSize: 17, color: Colors.black),
        ),
        subtitle: Text(
            'Precio: ${sale.price}',
            style: const TextStyle(fontSize: 15, color: Colors.grey)
        ),
    );
  }
}
