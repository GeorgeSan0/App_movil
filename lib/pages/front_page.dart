import 'package:app_movil/auth/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
    );
    child:
    Scaffold(
      backgroundColor: Colors.transparent,
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
        backgroundColor: Colors.black,
        width: MediaQuery.of(context).size.width * 0.60,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/diablo.png'),
                    fit: BoxFit.none,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                child: Text(
                  'MENÚ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 35,
                color: Colors.white,
              ),
              //trailing: const Icon(Icons.arrow_forward),
              title: Text(
                'INICIAR',
                style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.support, size: 35, color: Colors.white),
              //trailing: const Icon(Icons.arrow_forward),
              title: Text(
                'SUPPORT',
                style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                _launchURL();
              },
            ),
            ExpansionTile(
              leading: const Icon(
                Icons.contact_support,
                size: 35,
                color: Colors.white,
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                'CONTACTENOS',
                style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                        "assets/insta1.png"), // no matter how big it is, it won't overflow
                  ),
                  title: Text(
                    'INSTAGRAM',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    _launchInsta();
                  },
                ),
                ListTile(
                  leading: const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                        "assets/what.png"), // no matter how big it is, it won't overflow
                  ),
                  title: Text(
                    'WHATSAPP',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    _launchWhat();
                  },
                ),
                ListTile(
                  leading: const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                        "assets/tik_tok.png"), // no matter how big it is, it won't overflow
                  ),
                  title: Text(
                    'TIK TOK',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    _launchTikTok();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.hotelesecuador.com';
  if (await launch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchInsta() async {
  const url = 'https://www.instagram.com/denniscaisa/';
  if (await launch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchTikTok() async {
  const url = 'https://www.tiktok.com/@adrianguevara14';
  if (await launch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchWhat() async {
  const url = "https://wa.me/+593992549276";
  launch(url);
}
