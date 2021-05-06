import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class NutritionManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const ticks = [50, 75, 100, 125, 150];
    var features = ["エネルギー", "炭水化物", "塩分", "脂質", "糖質", "食物繊維", "タンパク質"];


    // ["エネルギー", "炭水化物", "塩分", "脂質", "糖質", "食物繊維", "タンパク質"]
    var targetIntake = [2650.0, 380.9, 7.5, 73.6, 397.5, 21.0, 65.0];  //18~29才までの目標摂取量
    var data = [
      [100, 100, 100, 100, 100, 100, 100],
      [0, 0, 0, 0, 0, 0, 0]
    ];

    double carbohydrateSum = 0.0;
    double dietaryFiberSum = 0.0;
    double lipidSum = 0.0;
    double proteinSum = 0.0;
    double saltSum = 0.0;
    double sugarSum = 0.0;
    double calSum = 0.0;
    
    List<String> docId = [];
    
    Future<void> getTodayNutrition() async{
      FirebaseFirestore fbfs = FirebaseFirestore.instance;
      await fbfs.collection('receipt')
              .where('user_id', isEqualTo: 1)
              .get()
              .then((value){
                value.docs.forEach((element) {
                  docId.add(element.id);
                });
      });
      
      for(int i = 0; i < docId.length; i++) {
        await fbfs.collection('receipt')
            .doc(docId[i])
            .collection('receipt_detail')
            .where('created_at', isLessThanOrEqualTo: Timestamp.fromDate(DateTime.now()))
            .where('created_at', isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime.now().add(Duration(days: 1) * -1)))
            .get()
            .then((value) {
              value.docs.forEach((element) {
                calSum += element['food_cal'];
                carbohydrateSum += element['food_carbohydrate'];
                dietaryFiberSum += element['food_dietary_fiber'];
                lipidSum += element['food_lipid'];
                proteinSum += element['food_protein'];
                saltSum += element['food_salt'];
                sugarSum += element['food_sugar'];
              });
        });
      }
     
    }
    
    
    return FutureBuilder(
      future: getTodayNutrition(),
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          return Text('value: ${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text('error: ${snapshot.error}');
        }



        // ["エネルギー", "炭水化物", "塩分", "脂質", "糖質", "食物繊維", "タンパク質"]
        data[1][0] = (calSum * 100 / targetIntake[0]).toInt();
        data[1][1] = (carbohydrateSum * 100 / targetIntake[1]).toInt();
        data[1][2] = (saltSum * 100 / targetIntake[2]).toInt();
        data[1][3] = (lipidSum * 100 / targetIntake[3]).toInt();
        data[1][4] = (sugarSum * 100 / targetIntake[4]).toInt();
        data[1][5] = (dietaryFiberSum * 100 / targetIntake[5]).toInt();
        data[1][6] = (proteinSum * 100 / targetIntake[6]).toInt();


        print(sugarSum);

        return Center(
          child: Column(

            children: [


              Container(
                  child: Text(
                      "栄養摂取量",
                  )
              ),

              Expanded(
                child: RadarChart.light(
                  ticks: ticks,
                  features: features,
                  data: data,
                  reverseAxis: false,
                  useSides: false,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
