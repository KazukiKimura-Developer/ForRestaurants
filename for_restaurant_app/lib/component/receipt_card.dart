import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class ReceiptCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //お店のロゴ
            Image.asset(
              'images/hal_logo.jpg',
              width: 100,
            ),

            //お店情報

            Text("ハンバーグ木村"),
            Text("〒111-1111"),
            Text("愛知県名古屋市江戸川区3丁目"),
            SizedBox(height: 30),

            //日時
            Row(
                children:[
                  Text("2020/04/06　"),
                  Text("14:25:37"),
                ]
            ),

            //担当
            Row(
              children: [
                Text("レジ：00001　"),
                Text("担当:00001"),
              ],
            ),

            SizedBox(height:30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ハンバーグ定食"),
                Text("1200円")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ご飯大盛り"),
                Text("100円"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("エビフライトッピング"),
                Text("250円"),
              ],
            ),

            SizedBox(height:30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("合計"),
                Text("1550円"),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("消費税"),
                Text("155円"),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
