import 'package:flutter/material.dart';
import 'package:for_restaurant_app/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static List<Widget> _pageList = [
    Card(
      color: Colors.blue,
      child: Container(
        width: 100,
        height: 100,
      ),
    ),
    Card(
      color: Colors.yellow,
      child: Container(
        width: 100,
        height: 100,
      ),
    ),
    Card(
      color: Colors.red,
      child: Container(
        width: 100,
        height: 100,
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Consumer<MainModel>(builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("demo"),
            ),
            body: Center(
                child: _pageList[model.selectedIndex]
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long),
                  label: "レシート",

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood_outlined),
                  label: "管理",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_applications),
                    label: "設定"
                ),
              ],
              currentIndex: model.selectedIndex,
              selectedItemColor: Colors.indigo,
              onTap: (index){
                model.onItemTapped(index);
              },
          ),
          );
        }),
      ),
    );
  }
}