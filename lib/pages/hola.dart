import 'package:flutter/material.dart';

class Hola extends StatefulWidget {
  Hola({Key? key}) : super(key: key);

  @override
  State<Hola> createState() => _HolaState();
}

class _HolaState extends State<Hola> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Hola"),
      ),
    );
  }
}
