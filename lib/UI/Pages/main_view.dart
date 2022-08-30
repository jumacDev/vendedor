import 'package:flutter/material.dart';
import 'package:vendedor/MODELS/sale_model.dart';
import 'package:vendedor/MODELS/seller_model.dart';
//import 'package:vendedor/UI/Pages/input_page.dart';
//import 'package:vendedor/UI/Pages/sales_page.dart';
import 'package:vendedor/UI/Style/color_to_views.dart';
import '../Widgets/main_menu.dart';


class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();

}

class _MainViewState extends State<MainView> {
  bool isSelect = false;
  bool isSelect1 = false;
  bool isSelect2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: sellerBody(context),
      drawer: mainMenu(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: const Text('Siguiente', style: TextStyle(fontSize: 20,color: Colors.white),),
        backgroundColor: primarycolor,

      ),
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
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15,),
          ActionChip(
            avatar: const Icon(Icons.abc, size: 60,),
            backgroundColor: isSelect? primarycolor : Colors.grey,
              label: const Text('Loteria 1', style: TextStyle(fontSize: 40, color: Colors.white),),
              onPressed: (){
              setState(() {
                isSelect = !isSelect;
              });
              }
          ),
          const SizedBox(height: 15,),
          ActionChip(
              avatar: const Icon(Icons.abc, size: 60),
              backgroundColor: isSelect1? primarycolor : Colors.grey,
              label: const Text('Loteria 2', style: TextStyle(fontSize: 40, color: Colors.white),),
              onPressed: (){
                setState(() {
                  isSelect1 = !isSelect1;
                });
              }
          ),
          const SizedBox(height: 15,),
          ActionChip(
              avatar: const Icon(Icons.abc, size: 60),
              backgroundColor: isSelect2? primarycolor : Colors.grey,
              label: const Text('Loteria 3', style: TextStyle(fontSize: 40, color: Colors.white),),
              tooltip: 'Hora de cierre 6 pm',
              onPressed: (){
                setState(() {
                  isSelect2 = !isSelect2;
                });
              }
          ),
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
