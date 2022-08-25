import 'package:app_movil/pages/prueba.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Explorer extends StatefulWidget {
  Explorer({Key? key}) : super(key: key);

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  int _currentIndex = 0;

  List cardList = [Item1(), Item2(), Item3(), Item4()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Card Carousel App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            title: const Text(
              "EXPLORE",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
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
          body: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              const Text("HOTELES",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 20.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          )),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/fondo.jpeg"),
          fit: BoxFit.fitHeight,
          opacity: 60,
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
            fit: BoxFit.scaleDown,
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
            backgroundColor: Colors.amber,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Prueba()),
              );
            },
            child: const Icon(Icons.hotel),
          ),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/fondo.jpeg"),
          fit: BoxFit.fitHeight,
          opacity: 60,
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
            fit: BoxFit.scaleDown,
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
            backgroundColor: Colors.amber,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Prueba()),
              );
            },
            child: const Icon(Icons.hotel),
          ),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/fondo.jpeg"),
          fit: BoxFit.fitHeight,
          opacity: 60,
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
            fit: BoxFit.scaleDown,
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
            backgroundColor: Colors.amber,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Prueba()),
              );
            },
            child: const Icon(Icons.hotel),
          ),
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/fondo.jpeg"),
          fit: BoxFit.fitHeight,
          opacity: 60,
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
            fit: BoxFit.scaleDown,
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
            backgroundColor: Colors.amber,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Prueba()),
              );
            },
            child: const Icon(Icons.hotel),
          ),
        ],
      ),
    );
  }
}
