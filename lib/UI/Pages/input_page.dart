import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/payment_page.dart';
import 'package:vendedor/UI/Widgets/main_menu.dart';
import '../Style/buttons_style.dart';
import '../Style/color_to_views.dart';

class InputPage extends StatefulWidget {
  final String user;
  const InputPage(this.user,{Key? key}) : super(key: key);

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


  int totalprice = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: regNumberBody(),
      drawer: mainMenu(context, widget.user),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: primarycolor,
      title: Text(
        'Usuario: ${widget.user}',
        style: const TextStyle(color: Colors.white),
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
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: 190,
                        height: 90,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              maxLength: 4,
                              textInputAction: TextInputAction.next,
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
                                if (value!.toString().length < 3  || value.isEmpty) {
                                  return 'Inválido';
                                }
                                return null;
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        height: 90,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              maxLength: 4,
                              textInputAction: TextInputAction.next,
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
                                if (value!.toString().length < 3  || value.isEmpty) {
                                  return 'Inválido';
                                }
                                return null;
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        height: 90,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              maxLength: 4,
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
                                if (value!.toString().length < 3 || value.isEmpty) {
                                  return 'Inválido';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  ),
                  //Precios
                  Column(
                    children: [
                      const SizedBox(width: 10,),
                      const Center(
                        child: Text("Valor", style: TextStyle(fontSize: 25)),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 200,
                        height: 90,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                          child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              onChanged: (value){
                                if(value.length >= 4){
                                  totalprice += int.parse(value);
                                } else if(value.isEmpty){
                                  totalprice = 0;
                                }
                              },
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
                                if (value!.toString().length < 4) {
                                  return 'Inválido';
                                }
                                return null;

                              }),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 90,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                          child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              onChanged: (value){
                                if(value.length >= 4){
                                  totalprice += int.parse(value);
                                } else if(value.isEmpty){
                                  totalprice = 0;
                                }
                              },
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
                                if (value!.toString().length < 4 || value.isEmpty) {
                                  return 'Inválido';
                                }
                                return null;
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 90,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                          child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              onChanged: (value){
                                if(value.length >= 4){
                                  totalprice += int.parse(value);
                                } else if(value.isEmpty){
                                  totalprice = 0;
                                }
                              },
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
                                if (value!.toString().length < 4 || value.isEmpty) {
                                  return 'Inválido';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 150,),
              const SizedBox(height: 20,),
              Center(
                child: Text("Total a pagar: ${totalprice.toString()}", style: const TextStyle(fontSize: 15)
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
                      child: OutlinedButton(
                        style: buttonsStyle(),
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
                      child: OutlinedButton(
                        style: buttonsStyle(),
                        onPressed: () {
                          //avanzando a vista de pagos
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PaymentView(widget.user)));
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
