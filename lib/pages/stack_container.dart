import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class stack_container extends StatelessWidget {
  stack_container({
    Key? key,
  }) : super(key: key);

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Hace que se suba el circle avatar
      height: 293.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper1(),
            child: Container(
              height: 150.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cotopaxi.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              //color: Colors.green[300],
            ),
          ),
          Align(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.green.shade300,
                  radius: 60.0,
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                ),
                const SizedBox(height: 4.0),
                //El nombre sacado de la base de datos
                StreamBuilder(
                  stream: users.doc('2N2Qz2iRB1yI6mppBXz8').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      return Text(
                        snapshot.data.data()['first name'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                StreamBuilder(
                  stream: users.doc('2N2Qz2iRB1yI6mppBXz8').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      return Text(
                        snapshot.data.data()['last name'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                IconButton(
                    tooltip: 'Cerrar Sesión',
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: const Icon(Icons.logout),
                    color: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 155);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
