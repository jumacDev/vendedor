import 'package:flutter/material.dart';
import '../Pages/main_view.dart';
import '../Style/color_to_views.dart';

Future<void> alertDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            alignment: Alignment.center,
            content: const SingleChildScrollView(
              child: Center(
                child: Text(
                  'Mensaje enviado correctamente',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MainView("")));
                },
                child: const Text(
                  'Aceptar',
                  style: TextStyle(color: primarycolor),
                ),
              )
            ]
        );
      }
  );
}