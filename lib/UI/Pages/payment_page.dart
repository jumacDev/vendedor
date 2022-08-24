import 'package:flutter/material.dart';
import 'package:vendedor/UI/Style/color_to_views.dart';
import 'package:vendedor/UI/Widgets/Main_menu.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final TextEditingController _numberPhoneText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paymentBody(context),
      appBar: myAppBar(context),
      drawer: mainMenu(context),
    );
  }

  myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primarycolor,
      title: const Text(
        'Usuario: XX',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  paymentBody(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(children: [
            const SizedBox(height: 60,),
            const Center(
              child: Text(
                "Número de Teléfono",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _numberPhoneText,
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
                        _numberPhoneText.text = value;
                      });
                      return null;
                    }
                  }),
            ),
            const SizedBox(height: 150,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              child: const Text("Total a pagar: XXXX", style: TextStyle(fontSize: 20),),),
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

                      },
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ]),
        ));
  }
}
