import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_restaurant_app/main_model.dart';
import 'package:for_restaurant_app/pages/receipt_page.dart';
import 'package:provider/provider.dart';
import 'package:for_restaurant_app/pages/nutrition_management_page.dart';
import 'package:for_restaurant_app/pages/setting_page.dart';
import 'package:for_restaurant_app/pages/select_receipt_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {

    List<Widget> _pageList = [
      SelectReceiptPage(),
      NutritionManagementPage(),
      SettingPage(),
    ];
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
              items: const<BottomNavigationBarItem>[
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
                model.onItemTapped = index;
              },
          ),
          );
        }),
      ),
    );
  }
}



