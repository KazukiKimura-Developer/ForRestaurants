import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SelectReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("receipt").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['receipt_id']),
                    subtitle: new Text(document['created_at']),
                  );
                }).toList(),
              );
          }
        });
  }
}


