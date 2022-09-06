import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/awards_view.dart';
import 'package:vendedor/UI/Pages/login_page.dart';
import 'package:vendedor/UI/Pages/main_view.dart';
import 'package:vendedor/UI/Pages/results_page.dart';
import 'package:vendedor/UI/Pages/sales_page.dart';
import 'package:vendedor/UI/Style/color_to_views.dart';

Widget mainMenu(BuildContext context, final String user) {
  return Drawer(
    shape: const RoundedRectangleBorder(),
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
       const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child:  Center(
              child:  Text('Millo Chance',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primarycolor,
                      fontSize: 20))),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          iconColor: primarycolor,
          title: const Text('Principal', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.home),
          textColor: primarycolor,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MainView(user)));
          },
        ),
        const SizedBox(
          height: 3,
        ),
        ListTile(
          iconColor: primarycolor,
          title: const Text('Mis ventas', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.point_of_sale),
          textColor: primarycolor,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SalesPage(user)));

          },
        ),
        const SizedBox(
          height: 3,
        ),
        ListTile(
          iconColor: primarycolor,
          title: const Text('Resultados', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.fact_check),
          textColor: primarycolor,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsView(user)));
          },
        ),
        const SizedBox(
          height: 3,
        ),
        ListTile(
          iconColor: primarycolor,
          title: const Text('Premios', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.emoji_events),
          textColor: primarycolor,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AwardsView(user)));
          },
        ),
        const SizedBox(
          height: 3,
        ),
        ListTile(
          iconColor: primarycolor,
          title: const Text('Cerrar Sesión', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.logout_outlined),
          textColor: primarycolor,
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false);
          },
        ),
        const SizedBox(
          height: 3,
        ),
      ],
    ),
  );
}
