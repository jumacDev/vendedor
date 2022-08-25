import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/login_page.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(const SellerApp());
  });

}

class SellerApp extends StatefulWidget {
  const SellerApp({Key? key}) : super(key: key);
  @override
  State<SellerApp> createState() => _SellerAppState();
}

class _SellerAppState extends State<SellerApp> {
  @override
  void initState(){
    super.initState();
    getUsers();
  }
  void getUsers() async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("chile");
    QuerySnapshot users = await collectionReference.get();

    if (users.docs.length != 0){
      for (var doc in users.docs){
        print(doc.data());
      }
    }
}
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendedores',
      home: LoginPage(),
    );
  }
}
