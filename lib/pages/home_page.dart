import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../read data/get_user_name.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  var toggleValue1 = [true, false, true];
  var dropDownValue1 = 1;
  var dropDownValue2 = 1;

  ////Documents IDs
  List<String> docIDs = [];

  get data => null;

  // get docids
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
            }));
  }

  @override
  void initSatet() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          user.email!,
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.white),
        ),
        //Text(user.email!),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  border: Border.all(
                      color: const Color.fromARGB(255, 253, 165, 24), width: 4),
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/foto.jpg',
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  user.email! + '\n',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 100),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              Text(
                'Número \n de dias',
                style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ]),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
            ),
            ButtonWidgetEx1(
              name: "Selecionar dias",
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
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              Text(
                'Presupuesto',
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.white),

                // style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //     fontSize: 30),
              ),
              const Icon(
                Icons.attach_money,
                color: Colors.orange,
                size: 50,
              )
            ]),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              ButtonWidgetEx2(
                child2: DropdownButton(
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
    );
  }
}

class ButtonWidgetEx1 extends StatelessWidget {
  final String name;
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const ButtonWidgetEx1({required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 12.8,
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
