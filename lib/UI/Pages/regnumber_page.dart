import 'package:flutter/material.dart';

class RegNumberPage extends StatefulWidget {
  const RegNumberPage({Key? key}) : super(key: key);

  @override
  State<RegNumberPage> createState() => _RegNumberPageState();
}

class _RegNumberPageState extends State<RegNumberPage> {
  final TextEditingController _numberText = TextEditingController();
  final TextEditingController _priceText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: regNumberBody(),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: const Text(
        'Registrar Número',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  regNumberBody() {
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _numberText,
                  decoration: InputDecoration(
                    labelText: 'Número',
                    floatingLabelStyle:
                    MaterialStateTextStyle.resolveWith((states) {
                      return const TextStyle(color: Colors.black);
                    }),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                    validator: (value) {
                      if (value.toString().length < 3 && value.toString().length >= 4) {
                        return 'Número no válido';
                      }else{
                        setState(() {
                          _numberText.text = value!;
                        });
                        return null;
                      }

                    }
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Loteria: XXXXXXXX',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _priceText,
                    decoration: InputDecoration(
                      labelText: 'Precio',
                      floatingLabelStyle:
                          MaterialStateTextStyle.resolveWith((states) {
                        return const TextStyle(color: Colors.black);
                      }),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Precio no válido';
                      } else {
                        setState(() {
                          _priceText.text = value;
                        });
                        return null;
                      }
                    }
                  )),
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
                      if(_formKey.currentState!.validate()){
                        print(_priceText);
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      'Registrar',
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
            ],
          ),
        ));
  }
}
