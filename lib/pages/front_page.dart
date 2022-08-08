import 'package:app_movil/auth/main_page.dart';
import 'package:app_movil/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage('assets/cotopaxi.jpg'),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken),
          new Center(
              child: Image(
            image: new AssetImage('assets/cotopaxi.jpg'),
            height: 210,
          )),
          new Center(
            child: Text(
              'Llacta Nina Tours',
              style: GoogleFonts.bebasNeue(
                fontSize: 47,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage('assets/mariposa.png'),
                //     fit: BoxFit.none,
                //     alignment: Alignment.centerLeft,
                //   ),
                // ),
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                'INICIAR',
                style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
            )
            // ElevatedButton(
            //   child: const Text('Open route'),
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => MainPage()));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
