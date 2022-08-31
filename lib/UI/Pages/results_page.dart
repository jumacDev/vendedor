// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import '../Style/color_to_views.dart';
import '../Widgets/Main_menu.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({Key? key}) : super(key: key);

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
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
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
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
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: DataTable(
                columnSpacing: 10,
                columns: const <DataColumn>[
                  DataColumn(label: Text('Loteria')),
                  DataColumn(label: Text('Número')),
                ],
                rows: const <DataRow>[
                  DataRow(cells: <DataCell>[
                    DataCell(Text('Cundi')),
                    DataCell(Text('2322')),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text('Risaralda')),
                    DataCell(Text('4525')),
                  ])

                ]),
          ),

        ],
      ),
    );
  }
}

