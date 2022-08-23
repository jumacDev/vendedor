import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/seller_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userText = TextEditingController();
  final TextEditingController _passText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late bool _obscureText;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: loginBody(),
    );
  }

  AppBar myAppbar() => AppBar(
        title: const Text(
          'MilloChance Vendedor',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 46, 83),
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
            const SizedBox(height: 150),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
              child: TextFormField(
                controller: _userText,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  floatingLabelStyle:
                      MaterialStateTextStyle.resolveWith((states) {
                    return const TextStyle(color: Colors.black);
                  }),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
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
                      return const TextStyle(color: Colors.black);
                    }),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    suffixIcon: CupertinoButton(
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
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
                // ignore: deprecated_member_use
                child: RaisedButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  color: Colors.grey,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //lógica de inicio de sesión aquí

                      //reiniciando campos de inicio de sesión
                      _userText.clear();
                      _passText.clear();
                      _formKey.currentState!.reset();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellerPage()),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
