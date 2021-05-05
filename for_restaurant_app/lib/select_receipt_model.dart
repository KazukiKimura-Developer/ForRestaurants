import 'package:flutter/material.dart';

class SelectReceiptModel extends ChangeNotifier {
  String _restaurantDocId;
  String _restaurantName, _restaurantAddress, _restaurantPhone, _receiptDate, _restaurantPostNum;
  int _restaurantCount = 0;


  List<int> _menuPrice = [];
  List<int> _menuTax = [];
  List<String> _menuName = [];



  get menuPrice => _menuPrice;
  get menuTax => _menuTax;
  get menuName => _menuName;
  get restaurantDocId => _restaurantDocId;
  get restaurantName => _restaurantName;
  get restaurantAddress =>  _restaurantAddress;
  get restaurantPhone => _restaurantPhone;
  get receiptDate => _receiptDate;
  get restaurantPostNum => _restaurantPostNum;
  get restaurantCount => _restaurantCount;


  // notifyListeners();

  set setRestaurantName(String name){
    _restaurantName = name;
    // notifyListeners();
  }

  set setRestaurantPhone(String phone){
    _restaurantPhone = phone;
    // notifyListeners();
  }

  set setRestaurantPostNum(String postnum){
    _restaurantPostNum = postnum;
    // notifyListeners();
  }

  set setReceiptDate(String receiptDate){
    _receiptDate = receiptDate;
    // notifyListeners();
  }

  set setRestaurantAddress(String addresss){
    _restaurantAddress = addresss;
    // notifyListeners();
  }

  set setRestaurantDocId(String docId){
    _restaurantDocId = docId;
    // notifyListeners();
  }

  set setMenuName(String menuname){
    _menuName.add(menuname);
    _restaurantCount++;
    // notifyListeners();
  }

  set setMenuPrice(int price){
    _menuPrice.add(price);
    // notifyListeners();
  }

  set setMenuTax(int tax){
    _menuTax.add(tax);
    // notifyListeners();
  }

  void initValue(){
    _menuPrice.clear();
    _menuTax.clear();
    _menuName.clear();
    _restaurantCount = 0;
  }



}