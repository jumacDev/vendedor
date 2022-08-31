// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import '../Style/color_to_views.dart';
import '../Widgets/Main_menu.dart';

class AwardsView extends StatefulWidget {
  const AwardsView({Key? key}) : super(key: key);

  @override
  State<AwardsView> createState() => _AwardsViewState();
}

class _AwardsViewState extends State<AwardsView> {
  late DateTime saleDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: buildSales(),
      drawer: mainMenu(context),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: primarycolor,
      title: const Text(
        'Usuario: XX',
        style: TextStyle(color: Colors.white),
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
              // ignore: deprecated_member_use
              child: RaisedButton(
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
                                primary: primarycolor, // button text color
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
                color: primarycolor,
                child: const Text(
                  'Seleccionar Fecha',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              )),
          const SizedBox(height: 50,),
          SingleChildScrollView(
            child: DataTable(
                columnSpacing: 30,
                columns: const <DataColumn>[
                  DataColumn(label: Text('Número')),
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
                    DataCell(Text('4525')),
                    DataCell(Text('Risaralda')),
                    DataCell(Text('1500')),
                    DataCell(Text('345725554'))
                  ])

                ]),
          ),
          const SizedBox(height: 15,),
          const Center(
            child: Text('Total Pagado en Premios: 0',style: TextStyle(fontSize: 20),),
          )
        ],
      ),
    );
  }
}

