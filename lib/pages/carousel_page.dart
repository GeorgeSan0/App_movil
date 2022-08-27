import 'package:app_movil/pages/hotel_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatefulWidget {
  Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          "EXPLORE",
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.black),
        ),
      ),
      body: CarouselSlider(
          slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 50),
              currentIndicatorColor: Colors.white),
          unlimitedMode: true,
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.3,
                      1
                    ],
                    colors: [
                      Color(0xffff4000),
                      Color(0xffffcc66),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Image.asset(
                    'assets/hoteles/hotel1.jpeg',
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                  const Text("** San Agustin Plaza **",
                      style: TextStyle(
                          height: 3,
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  const Text("Habitaciones desde 90 dolares",
                      style: TextStyle(
                          height: 3,
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page(
                              'assets/hoteles/hotel1.jpeg',
                              "San Agustin Plaza",
                              "Rio Cristal"),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.3,
                      1
                    ],
                    colors: [
                      Color(0xffff4000),
                      Color(0xffffcc66),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Image.asset(
                    'assets/hoteles/hotel2.jpeg',
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                  const Text("** San Agustin Plaza **",
                      style: TextStyle(
                          height: 3,
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  const Text("Habitaciones desde 90 dolares",
                      style: TextStyle(
                          height: 3,
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page(
                              'assets/hoteles/hotel2.jpeg',
                              "San Agustin Plaza",
                              "Rio Cristal"),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.3,
                      1
                    ],
                    colors: [
                      Color(0xffff4000),
                      Color(0xffffcc66),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Image.asset(
                    'assets/hoteles/hotel3.jpeg',
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                  const Text("** San Agustin Plaza **",
                      style: TextStyle(
                          height: 3,
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  const Text("Habitaciones desde 90 dolares",
                      style: TextStyle(
                          height: 3,
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page(
                              'assets/hoteles/hotel3.jpeg',
                              "San Agustin Plaza",
                              "Rio Cristal"),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.3,
                      1
                    ],
                    colors: [
                      Color(0xffff4000),
                      Color(0xffffcc66),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Image.asset(
                    'assets/hoteles/hotel4.jpeg',
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                  const Text("** San Agustin Plaza **",
                      style: TextStyle(
                          height: 3,
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  const Text("Habitaciones desde 90 dolares",
                      style: TextStyle(
                          height: 3,
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page(
                              'assets/hoteles/hotel4.jpeg',
                              "San Agustin Plaza",
                              "Rio Cristal"),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
