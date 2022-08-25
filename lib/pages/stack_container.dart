import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class stack_container extends StatelessWidget {
  const stack_container({
    Key? key,
  }) : super(key: key);

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
              height: 180.0,
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
                  radius: 64.0,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                ),
                SizedBox(height: 8.0),
                //El nombre sacado de la base de datos
                Text("Dennis Caiza",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
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
