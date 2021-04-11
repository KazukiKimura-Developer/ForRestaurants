import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
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
              Text("ハンバーグ木村"),
              Text("〒111-1111"),
              Text("愛知県名古屋市江戸川区3丁目"),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ハンバーグ定食"),
                  Text("200円")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
