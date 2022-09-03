// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/main_view.dart';
import '../Style/buttons_style.dart';
import '../Style/color_to_views.dart';
import '../Widgets/snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userText = TextEditingController();
  final TextEditingController _passText = TextEditingController();

  bool _login = false;

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
  Future validarDatos() async{
    try{
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();
      print("Usuario a buscar: ${_userText.text}");
      print("Contraseña a buscar: ${_passText.text}");
      // ignore: prefer_is_empty
      if (usuario.docs.isNotEmpty){
        for (var cursor in usuario.docs){

          print('Cursor: ${cursor.data()}');

          if(cursor.get('Nombre').toString() == _userText.text){
            if (cursor.get('Contrasena').toString() == _passText.text){
              _login = true;

              break;
            }
          }else{
            snackbar(context, 'Usuario o Contraseña Incorrectos');
            _login = false;
          }
        }
      }else{
        print("No hay objetos en la coleccion");
        snackbar(context, 'Ha ocurrido un error');
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
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      snackbar(context, 'Revisando...');
                      validarDatos().then((value) {
                        if(_login) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainView()),
                                  (route) => false
                          );
                        }
                      });



                    }
                   // _userText.clear();
                    //_passText.clear();
                    //_formKey.currentState!.reset();
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
