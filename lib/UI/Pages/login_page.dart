import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/main_view.dart';
import '../Style/buttons_style.dart';
import '../Style/color_to_views.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userText = TextEditingController();
  final TextEditingController _passText = TextEditingController();

  bool login = false;

  final _formKey = GlobalKey<FormState>();

  late bool _obscureText;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _obscureText = true;
  }
  //-------------------------------------backend--------------------------------
  validarDatos() async{
    try{
      CollectionReference ref= FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario= await ref.get();
      print("Usuario a bursar");
      print(_userText.text);
      print("Contraseña a buscar");
      print(_passText.text);
      if (usuario.docs.length != 0){
        for (var cursor in usuario.docs){
          if(cursor.get('Nombre')==_userText.text){
            print("Usuario encontrado");
            if (cursor.get('Contrasena')==_passText.text){
              print("Credenciales correctas");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainView()),
                      (route) => false
              );
              login= true;
            }
          }else{
            print("Usuario NO encontrado");
          }
        }
        login = false;
      }else{
        print("No hay objetos en la coleccion");
      }
    }catch(e){
      print('Error .....${e.toString()}');
    }
  }



//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: loginBody(),
    );
  }

  AppBar myAppbar() => AppBar(
        title: const Text(
          'MilloChance - Vendedor',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primarycolor,
      );

  loginBody() {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 130),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
              child: TextFormField(
                controller: _userText,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  floatingLabelStyle:
                      MaterialStateTextStyle.resolveWith((states) {
                    return const TextStyle(color: primarycolor);
                  }),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
              child: TextFormField(
                controller: _passText,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    labelText: 'Clave',
                    floatingLabelStyle:
                        MaterialStateTextStyle.resolveWith((states) {
                      return const TextStyle(color: primarycolor);
                    }),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primarycolor)),
                    suffixIcon: CupertinoButton(
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primarycolor,
                        ),
                        onPressed: () {
                          _obscureText = !_obscureText;
                          setState(() {});
                        })),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: OutlinedButton(
                  style: buttonsStyle(),
                  onPressed: () {
                    validarDatos();
                    print(login);
                    if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Revisando')),
                    );

                    //if(login == true){
                      // if (_formKey.currentState!.validate()) {
                      // lógica de inicio de sesión aquí



                   // }else{
                     // print("no se pudo iniciar sesion");
                      //reiniciando campos de inicio de sesión
                    };
                    _userText.clear();
                    _passText.clear();
                    _formKey.currentState!.reset();
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
