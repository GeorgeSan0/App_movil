import 'package:app_movil/pages/stack_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'carousel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  var toggleValue1 = [true, false, true];
  var dropDownValue1 = 1;
  var dropDownValue2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          "PERFIL",
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          stack_container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(user.email!,
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  const SizedBox(height: 8.0),
                  const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                    size: 10.0,
                  ),
                  const SizedBox(height: 10.0),
                  const Text("Correo",
                      style: TextStyle(fontSize: 13.0, color: Colors.white)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.airline_seat_individual_suite_sharp,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  Text(
                    '# de dias',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.add_card_sharp,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  Text('Presupuesto',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 15, color: Colors.white)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  ButtonWidgetEx1(
                    name: "Selecciona",
                    child: DropdownButton(
                      onChanged: (t) {
                        setState(() {
                          dropDownValue1 = t as int;
                        });
                      },
                      value: dropDownValue1,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text("1 día")),
                        DropdownMenuItem(value: 2, child: Text("2 días")),
                        DropdownMenuItem(value: 3, child: Text("4 días")),
                        DropdownMenuItem(value: 4, child: Text("6 días")),
                        DropdownMenuItem(value: 5, child: Text("7 días")),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  ButtonWidgetEx1(
                    name: "Selecciona",
                    child: DropdownButton(
                      onChanged: (t) {
                        setState(() {
                          dropDownValue1 = t as int;
                        });
                      },
                      value: dropDownValue1,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text("1 día")),
                        DropdownMenuItem(value: 2, child: Text("2 días")),
                        DropdownMenuItem(value: 3, child: Text("4 días")),
                        DropdownMenuItem(value: 4, child: Text("6 días")),
                        DropdownMenuItem(value: 5, child: Text("7 días")),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: MaterialButton(
              minWidth: 250.0,
              height: 50.0,
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Carousel()));
              },
              child: const Text(
                "Explorar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidgetEx1 extends StatelessWidget {
  final String name;
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const ButtonWidgetEx1({
    required this.name,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class ButtonWidgetEx2 extends StatelessWidget {
  final Widget child2;
  // ignore: use_key_in_widget_constructors
  const ButtonWidgetEx2({
    required this.child2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          child2,
        ],
      ),
    );
  }
}
