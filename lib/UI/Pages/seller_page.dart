import 'package:flutter/material.dart';
import 'package:vendedor/MODELS/sale_model.dart';
import 'package:vendedor/MODELS/seller_model.dart';
import 'package:vendedor/UI/Pages/input_page.dart';
import 'package:vendedor/UI/Pages/sales_page.dart';
import 'package:vendedor/UI/Style/color_to_views.dart';
import '../Widgets/main_menu.dart';


class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: sellerBody(context),
      drawer: mainMenu(context),
    );
  }

  myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primarycolor,
      title: const Text('Usuario: XX', style: TextStyle(color: Colors.white),),
      centerTitle: true,
    );
  }

  sellerBody(BuildContext context) {
    Seller seller = buildseller();
    return Column(
      children: [
        const SizedBox(height: 200),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InputPage()));
              },
              child: const Text('Registrar Número', style: TextStyle(color: Colors.black),),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SalesPage(saleslist: seller.saleslist)));
              },
              child: const Text('Ver Números Registrados', style: TextStyle(color: Colors.black),),
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
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => const MainView()),
                        (route) => false);
              },
              child: const Text('Hacer Corte del día', style: TextStyle(color: Colors.black),),
            ))

      ],
    );
  }

  Seller buildseller() {
    Seller sellerinst = Seller('seller123l');
    Sale sale = Sale('1234', '1000');
    Sale sale2 = Sale('3256', '2000');
    Sale sale3 = Sale('1457', '3000');
    Sale sale4 = Sale('1234', '4000');
    Sale sale5 = Sale('1343', '1000');

    sellerinst.saleslist.add(sale);
    sellerinst.saleslist.add(sale2);
    sellerinst.saleslist.add(sale3);
    sellerinst.saleslist.add(sale4);
    sellerinst.saleslist.add(sale5);

    return sellerinst;
  }
}
