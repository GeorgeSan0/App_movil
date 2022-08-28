import 'package:app_movil/pages/hotel_page.dart';
import 'package:app_movil/pages/hotel_page_four.dart';
import 'package:app_movil/pages/hotel_page_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'hotel_page_two.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CollectionReference hotel = FirebaseFirestore.instance.collection('hotels');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: CarouselSlider(
          slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 20),
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
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/hoteles/hotel1.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  StreamBuilder(
                    stream: hotel.doc('naOr5F4SiNlmC9PKPivD').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            snapshot.data.data()['name'],
                            style: const TextStyle(
                                height: 3,
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page(
                            'assets/hoteles/hotel1.jpeg',
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                  const Text("",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 3,
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
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
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/hoteles/hotel2.jpeg',
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  StreamBuilder(
                    stream: hotel.doc('7jCGhqfRidASLlmHnSX8').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            snapshot.data.data()['name'],
                            style: const TextStyle(
                                height: 3,
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page_two(
                            'assets/hoteles/hotel2.jpeg',
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                  const Text("",
                      style: TextStyle(
                        height: 3,
                        fontSize: 20.0,
                      )),
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
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/hoteles/hotel3.jpeg',
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  StreamBuilder(
                    stream: hotel.doc('n1Mz54LQlB2uuNg1LHNl').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            snapshot.data.data()['name'],
                            style: const TextStyle(
                                height: 3,
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page_three(
                            'assets/hoteles/hotel3.jpeg',
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                  const Text("",
                      style: TextStyle(
                        height: 3,
                        fontSize: 20.0,
                      )),
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
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/hoteles/hotel4.jpeg',
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  StreamBuilder(
                    stream: hotel.doc('0VBi8MP4YZZQt3BkVBgl').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            snapshot.data.data()['name'],
                            style: const TextStyle(
                                height: 3,
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hotel_page_four(
                            'assets/hoteles/hotel4.jpeg',
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.hotel),
                  ),
                  const Text("",
                      style: TextStyle(
                        height: 3,
                        fontSize: 20.0,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
