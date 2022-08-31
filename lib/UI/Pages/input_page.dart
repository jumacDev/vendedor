import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/payment_page.dart';
import 'package:vendedor/UI/Widgets/main_menu.dart';

import '../Style/color_to_views.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _numberText = TextEditingController();
  final TextEditingController _priceText = TextEditingController();
  final TextEditingController _numberText2 = TextEditingController();
  final TextEditingController _priceText2 = TextEditingController();
  final TextEditingController _numberText3 = TextEditingController();
  final TextEditingController _priceText3 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: regNumberBody(),
      drawer: mainMenu(context),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: primarycolor,
      title: const Text(
        'Usuario: XXX',
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
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Números
                  Column(
                    children: [
                      const SizedBox(width: 80,),
                      const Center(
                        child: Text("Número", style: TextStyle(fontSize: 25),),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 220,
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _numberText,
                              decoration: InputDecoration(
                                labelText: 'Número',
                                floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith((states) {
                                  return const TextStyle(
                                      color: primarycolor);
                                }),
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: primarycolor),
                                ),
                              ),
                              validator: (value) {
                                if (value!.toString().length > 10 || value.isEmpty) {
                                  return 'Número no válido';
                                } else {
                                  setState(() {
                                    _numberText.text = value;
                                  });
                                  return null;
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _numberText2,
                              decoration: InputDecoration(
                                labelText: 'Número',
                                floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith((states) {
                                  return const TextStyle(
                                      color: primarycolor);
                                }),
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: primarycolor),
                                ),
                              ),
                              validator: (value) {
                                if (value!.toString().length > 10 || value.isEmpty) {
                                  return 'Número no válido';
                                } else {
                                  setState(() {
                                    _numberText2.text = value;
                                  });
                                  return null;
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _numberText3,
                              decoration: InputDecoration(
                                labelText: 'Número',
                                floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith((states) {
                                  return const TextStyle(
                                      color: primarycolor);
                                }),
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: primarycolor),
                                ),
                              ),
                              validator: (value) {
                                if (value!.toString().length > 10 || value.isEmpty) {
                                  return 'Número no válido';
                                } else {
                                  setState(() {
                                    _numberText3.text = value;
                                  });
                                  return null;
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                  //Precios
                  Column(
                    children: [
                      const SizedBox(width: 80,),
                      const Center(
                        child: Text("Valor", style: TextStyle(fontSize: 25)),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 220,
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _priceText,
                              decoration: InputDecoration(
                                labelText: 'Valor',
                                floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith((states) {
                                  return const TextStyle(
                                      color: primarycolor);
                                }),
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: primarycolor),
                                ),
                              ),
                              validator: (value) {
                                if (value!.toString().length > 10 || value.isEmpty) {
                                  return 'Número no válido';
                                } else {
                                  setState(() {
                                    _priceText.text = value;
                                  });
                                  return null;
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _priceText2,
                              decoration: InputDecoration(
                                labelText: 'Valor',
                                floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith((states) {
                                  return const TextStyle(
                                      color: primarycolor);
                                }),
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: primarycolor),
                                ),
                              ),
                              validator: (value) {
                                if (value!.toString().length > 10 || value.isEmpty) {
                                  return 'Número no válido';
                                } else {
                                  setState(() {
                                    _priceText2.text = value;
                                  });
                                  return null;
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _priceText3,
                              decoration: InputDecoration(
                                labelText: 'Valor',
                                floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith((states) {
                                  return const TextStyle(
                                      color: primarycolor);
                                }),
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: primarycolor),
                                ),
                              ),
                              validator: (value) {
                                if (value!.toString().length > 10 || value.isEmpty) {
                                  return 'Número no válido';
                                } else {
                                  setState(() {
                                    _priceText3.text = value;
                                  });
                                  return null;
                                }
                              }),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 150,),
              const SizedBox(height: 20,),
              const Center(
                child: Text("Total a pagar: XXX", style: TextStyle(fontSize: 15)
                )
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: primarycolor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Atrás',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: primarycolor,
                        onPressed: () {
                          //avanzando a vista de pagos
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const PaymentView()));
                        },
                        child: const Text(
                          'Registrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
