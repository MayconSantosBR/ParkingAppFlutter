import 'package:flutter/material.dart';
import '../components/header_component.dart';
import '../components/menu_component.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HeaderComponent(context),
        drawer: MenuComponent(context),
        body: const Center(
          child: Column(children: [
            Text(
              'Selecione uma opção no menu lateral',
              style: TextStyle(fontSize: 20),
            ),
          ], mainAxisAlignment: MainAxisAlignment.center),
        ));
  }
}
