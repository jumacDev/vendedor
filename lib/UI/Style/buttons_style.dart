import 'package:flutter/material.dart';
import 'package:vendedor/UI/Style/color_to_views.dart';

ButtonStyle buttonsStyle (){
  return TextButton.styleFrom(
      backgroundColor: primarycolor,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
     ),
  );
}