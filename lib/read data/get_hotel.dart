import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetHotelName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference hotels =
        FirebaseFirestore.instance.collection('hotels');

    return FutureBuilder<DocumentSnapshot>(
        future: hotels.doc('1').get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('Firs: ${data['name']}');
          }
          return Text('loading..');
        }));
  }
}
