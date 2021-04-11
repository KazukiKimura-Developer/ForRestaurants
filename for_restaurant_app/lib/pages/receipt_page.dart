import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 100,
          child: Row(
            children: [
              Image.asset('images/hal_logo.jpg')
            ],
          ),
        ),
      ),
    );
  }
}
