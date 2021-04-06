import 'package:flutter/material.dart';

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
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'demo'),
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

  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: _pageList[_selectedIndex]
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),

    );

  }
}
