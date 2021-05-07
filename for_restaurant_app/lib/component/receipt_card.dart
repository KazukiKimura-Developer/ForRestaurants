import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:for_restaurant_app/select_receipt_model.dart';


class ReceiptCard extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    int priceSum = 0;
    int taxSum = 0;

    return Consumer<SelectReceiptModel>(builder: (context, model, _){

      List<Widget> menu = [];

      for(int i = 0 ; i < model.restaurantCount; i++){
        print(model.menuPrice[i]);

        menu.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.menuName[i].toString()),
              Text(model.menuPrice[i].toString()),
            ],
          )
        );

        priceSum += model.menuPrice[i];
        taxSum += model.menuTax[i];


      }

      return Card(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //お店のロゴ
              Image.asset(
                'images/hal_logo.jpg',
                width: 100,
              ),

              //お店情報

              Text(model.restaurantName),
              Text("〒" + model.restaurantPostNum),
              Text(model.restaurantAddress),
              Text("℡" + model.restaurantPhone),
              SizedBox(height: 30),


              Text(model.receiptDate),


              // Row(
              //   children: [
              //     Text("レジ：00001　"),
              //     Text("担当:00001"),
              //   ],
              // ),

              SizedBox(height:30),


              for(int i = 0; i < model.restaurantCount; i++) menu[i],


              SizedBox(height:30),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("合計"),
                  Text(priceSum.toString()),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("消費税"),
                  Text(taxSum.toString()),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
