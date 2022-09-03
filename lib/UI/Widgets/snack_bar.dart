import 'package:flutter/material.dart';
import '../Style/color_to_views.dart';

snackbar (BuildContext context, String text){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text, style: const TextStyle(fontSize: 15),textAlign: TextAlign.center,),
        backgroundColor: primarycolor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
      )
  );
}
