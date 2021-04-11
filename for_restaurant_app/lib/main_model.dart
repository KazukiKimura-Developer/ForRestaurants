import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  set onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}