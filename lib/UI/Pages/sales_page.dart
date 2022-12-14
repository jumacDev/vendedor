// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:vendedor/UI/Style/color_to_views.dart';
import 'package:vendedor/UI/Widgets/main_menu.dart';

import '../Style/buttons_style.dart';

class SalesPage extends StatefulWidget {
  final String user;
  const SalesPage(this.user, {Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  late DateTime saleDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(),
        body: buildSales(),
        drawer: mainMenu(context, widget.user),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: primarycolor,
      title: Text(
        'Usuario: ${widget.user}',
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  buildSales() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: OutlinedButton(
                style: buttonsStyle(),
                onPressed: () async {
                  DateTime? saleDate = await showDatePicker(
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: primarycolor, // header background color
                            onPrimary: Colors.white, // header text color
                            onSurface: Colors.black, // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              backgroundColor: primarycolor, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                    context: context,
                    locale: const Locale('es', 'ES'),
                    initialDate: DateTime(2022, 01, 01),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2100));
                },
                child: const Text(
                  'Seleccionar Fecha',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              )),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text('Ventas del d??a: 1000', style: TextStyle(fontSize: 20),),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text('Mi porcentaje: 250', style: TextStyle(fontSize: 20),),
          ),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text('Listado n??meros vendidos', style: TextStyle(fontSize: 20),),
          ),
          SingleChildScrollView(
            child: DataTable(
                columnSpacing: 30,
                columns: const <DataColumn>[
                  DataColumn(label: Text('N??mero')),
                  DataColumn(label: Text('Loteria')),
                  DataColumn(label: Text('Precio')),
                  DataColumn(label: Text('Telefono')),
                ],
                rows: const <DataRow>[
                  DataRow(cells: <DataCell>[
                    DataCell(Text('2322')),
                    DataCell(Text('Cundi')),
                    DataCell(Text('1000')),
                    DataCell(Text('312312321'))
              ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text('2322')),
                    DataCell(Text('Cundi')),
                    DataCell(Text('1000')),
                    DataCell(Text('312312321'))
                  ])

            ]),
          ),
          const SizedBox(height: 15,),
          const Center(
            child: Text('Acumulado supervisor: 5000',style: TextStyle(fontSize: 20),),
          )
        ],
      ),
    );
  }
}
