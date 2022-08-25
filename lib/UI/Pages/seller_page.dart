import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
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
  final List <bool> isSelected = [false, false, false];
  List <bool> _selections =  List.generate(3, (_) => false);



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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          //-------------------------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
                onPressed: (int index) {
                  int count = 0;
                  isSelected.forEach((bool val) {
                    if (val) count++;
                  });

                  if (isSelected[index] && count < 2)
                    return;

                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
                isSelected: isSelected,
              ),
            ],
          ), //------------------------------------------------------------------
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleSwitch(
                activeBgColor: const [primarycolor],
                minWidth: 120,
                minHeight: 120,
                initialLabelIndex: 1,
                totalSwitches: 2,
                labels: const ['Lotería 1', 'No usar'],
                onToggle: (index) => print(index),
              ),
            ],
          ),
      const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleSwitch(
                activeBgColor: const [primarycolor],
                minWidth: 120,
                minHeight: 120,
                initialLabelIndex: 1,
                totalSwitches: 2,
                labels: const ['Lotería 2', 'No usar'],
                onToggle: (index) => print(index),
              ),


            ],
          ),
          const SizedBox(height: 150,),
      // ignore: deprecated_member_use
      RaisedButton(
        color: primarycolor,
        textColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        padding:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: const Text('Registrar Número'),
        onPressed: (){},
      )
        ],
      ),
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
