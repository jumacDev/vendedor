import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/login_page.dart';

void main(){
  runApp(const SellerApp());
}


class SellerApp extends StatefulWidget {
  const SellerApp({Key? key}) : super(key: key);

  @override
  State<SellerApp> createState() => _SellerAppState();
}

class _SellerAppState extends State<SellerApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendedores',
      home: LoginPage(),

    );
  }
}
