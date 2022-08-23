import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
