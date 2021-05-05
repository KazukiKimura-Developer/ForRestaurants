import 'package:flutter/material.dart';
import 'package:for_restaurant_app/component/receipt_card.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:for_restaurant_app/select_receipt_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ReceiptPage extends StatelessWidget {

    @override
    Widget build(BuildContext context){


    List<String> menuName = [];
    List<int> menuPrice = [];
    List<int> menuTax = [];

        return Consumer<SelectReceiptModel>(builder: (context, model, _){

            Future getMenuFirebase() async{
                  await FirebaseFirestore.instance
                  .collection('receipt')
                  .doc(model.restaurantDocId)
                  .collection('receipt_detail')
                  .get()
                  .then((value){
                value.docs.forEach((element) {
                  model.setMenuName = element['food_name'];
                  model.setMenuPrice = element['food_price'];
                  model.setMenuTax = element['food_tax'];
                  // print(model.menuName);
                });
              }
              );
            }


            print("サンバ");
            print(model.menuName);


            return Scaffold(
              appBar: AppBar(
                title: Text("レシート詳細"),
              ),
              body: Center(
                child: FutureBuilder(
                  future: getMenuFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('value: ${snapshot.data}');
                    } else if (snapshot.hasError) {
                      return Text('error: ${snapshot.error}');
                    }
                    return ReceiptCard();
                  }
              ),
              ),
            );
          });

      }





  }
