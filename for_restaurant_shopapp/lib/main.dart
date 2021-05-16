import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebaseMethod.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'お店側アプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;




  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              child: const Text('レシートデータ１'),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: addData1
            ),
            RaisedButton(
                child: const Text('レシートデータ2'),
                color: Colors.blueGrey,
                textColor: Colors.white,
                onPressed: addData2
            ),
            RaisedButton(
                child: const Text('レシートデータ3'),
                color: Colors.cyanAccent,
                textColor: Colors.white,
                onPressed: addData3
            ),
            RaisedButton(
                child: const Text('レシートデータ4'),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: addData4
            ),
          ],
        ),


      ),
    );
  }
}
