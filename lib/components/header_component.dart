import 'package:estacionamento/screens/create_screen.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget HeaderComponent(BuildContext context) {
  return AppBar(
    title: const Text('Desbrava Park'),
    centerTitle: true,
    backgroundColor: Colors.green,
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.add_circle),
        tooltip: 'Registrar nova vaga',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Create()),
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.add_alert),
        tooltip: 'Notificações',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Nenhuma notificação até o momento')));
        },
      ),
    ],
  );
}
