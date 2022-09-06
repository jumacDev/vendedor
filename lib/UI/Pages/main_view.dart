import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/input_page.dart';
import 'package:vendedor/UI/Style/color_to_views.dart';
import '../Widgets/main_menu.dart';


class MainView extends StatefulWidget {
  final String user;
  const MainView(this.user, {Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}


class _MainViewState extends State<MainView> {
  bool isSelect = false;
  bool isSelect1 = false;
  bool isSelect2 = false;

  //-------------------------------------------------------------------



  //-------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: sellerBody(context),
      drawer: mainMenu(context, widget.user),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage(widget.user)));
        },
        label: const Text('Siguiente', style: TextStyle(fontSize: 20,color: Colors.white),),
        backgroundColor: primarycolor,

      ),
    );
  }

  myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primarycolor,
      title: Text('Usuario: ${widget.user}', style: const TextStyle(color: Colors.white),),
      centerTitle: true,
    );
  }

  sellerBody(BuildContext context) {

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
}
