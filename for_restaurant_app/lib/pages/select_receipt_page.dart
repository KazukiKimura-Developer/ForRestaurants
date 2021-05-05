import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../pages/receipt_page.dart';
import 'package:flutter/material.dart';
import 'package:for_restaurant_app/select_receipt_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


class SelectReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();


    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("receipt").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              return Consumer<SelectReceiptModel>(builder: (context, model, child) {
                return ListView(
                  children: snapshot.data.docs.map((
                      DocumentSnapshot document) {
                    String receiptDate = document['created_at']
                        .toDate()
                        .toString();
                    return ListTile(
                      title: Text(document['restaurant_name']),
                      subtitle: Text(receiptDate),
                      onTap: () {
                        model.initValue();
                        model.setRestaurantDocId = document.id;
                        model.setRestaurantAddress = document['restaurant_address'];
                        model.setRestaurantName = document['restaurant_name'];
                        model.setRestaurantPhone = document['restaurant_phone'];
                        model.setRestaurantPostNum = document['restaurant_post_num'];
                        model.setReceiptDate = receiptDate;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReceiptPage()));
                      },
                    );
                  }).toList(),
                );

              });
          }
        });
  }
}


