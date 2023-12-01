import 'package:estacionamento/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../screens/create_screen.dart';
import '../screens/all_screen.dart';

Widget MenuComponent(BuildContext context) {
  return Drawer(
      child: ListView(children: <Widget>[
    UserAccountsDrawerHeader(
      accountName: const Text("Usuário"),
      accountEmail: const Text("usuario@gmail.com"),
      currentAccountPicture: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          child: Icon(Icons.local_parking_sharp)),
    ),
    ListTile(
      title: const Text("Página Inicial"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      },
    ),
    ListTile(
      title: const Text("Lista"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ListaPage()),
        );
      },
    ),
    ListTile(
      title: const Text("Criar"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Create()),
        );
      },
    ),
  ]));
}
