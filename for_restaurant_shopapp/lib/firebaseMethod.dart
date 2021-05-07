import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore fbfs = FirebaseFirestore.instance;


String randomString(int length) {
  const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const _charsLength = _randomChars.length;

  final rand = new Random();
  final codeUnits = new List.generate(
    length,
        (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);
    },
  );
  return new String.fromCharCodes(codeUnits);
}

Future<void> addDetail1of1(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .collection("receipt_detail")
      .add({
    'created_at': Timestamp.now(),
    'food_cal': 774,
    'food_salt': 4.0,
    'food_protein': 31.9,
    'food_lipid': 34.8,
    'food_carbohydrate': 79.7,
    'food_dietary_fiber': 5.6,
    'food_sugar': 74.1,
    'food_id': 40,
    'food_name': "塩さば朝定食",
    'food_price': 620,
    'food_tax': 62,
    'receipt_id': 2,
    'user_id': 1,

  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}


Future<void> addreceipt1(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .set({
    'created_at': Timestamp.now(),
    'receipt_id': 2,
    'restaurant_address': "愛知県豊田市田畑町1-1",
    'restaurant_id': 2,
    'restaurant_name': "定食HAL",
    'restaurant_phone': "091-333-3333",
    'restaurant_post_num': "333-3333",
    'user_id': 1
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add : $error"));
}




Future<void> addreceipt2(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .set({
    'created_at': Timestamp.now(),
    'receipt_id': 3,
    'restaurant_address': "岐阜県高山市恵比寿村14-1",
    'restaurant_id': 44,
    'restaurant_name': "パーソナルマート",
    'restaurant_phone': "021-555-5555",
    'restaurant_post_num': "555-5555",
    'user_id': 1
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add : $error"));
}


Future<void> addDetail1of2(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .collection("receipt_detail")
      .add({
    'created_at': Timestamp.now(),
    'food_cal': 254,
    'food_salt': 1.4,
    'food_protein': 9.6,
    'food_lipid': 13.8,
    'food_carbohydrate': 23.9,
    'food_dietary_fiber': 2.0,
    'food_sugar': 21.9,
    'food_id': 311,
    'food_name': "レタスサンド",
    'food_price': 245,
    'food_tax': 19,
    'receipt_id': 3,
    'user_id': 1,

  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}

Future<void> addDetail2of2(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .collection("receipt_detail")
      .add({
    'created_at': Timestamp.now(),
    'food_cal': 225,
    'food_salt': 2.9,
    'food_protein': 27.4,
    'food_lipid': 0.7,
    'food_carbohydrate': 2.0,
    'food_dietary_fiber': 1.3,
    'food_sugar': 21.9,
    'food_id': 311,
    'food_name': "胸肉のサラダ",
    'food_price': 280,
    'food_tax': 22,
    'receipt_id': 3,
    'user_id': 1,

  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}

Future<void> addreceipt3(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .set({
    'created_at': Timestamp.now(),
    'receipt_id': 3,
    'restaurant_address': "三重県津市小竹市2-1",
    'restaurant_id': 66,
    'restaurant_name': "大衆弁当",
    'restaurant_phone': "044-888-8888",
    'restaurant_post_num': "888-8888",
    'user_id': 1
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add : $error"));
}

Future<void> addDetail1of3(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .collection("receipt_detail")
      .add({
    'created_at': Timestamp.now(),
    'food_cal': 513,
    'food_salt': 2.8,
    'food_protein': 24.4,
    'food_lipid': 2.8,
    'food_carbohydrate': 80.3,
    'food_dietary_fiber': 7.3,
    'food_sugar': 73.0,
    'food_id': 131,
    'food_name': "鮭弁当",
    'food_price': 440,
    'food_tax': 44,
    'receipt_id': 4,
    'user_id': 1,
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}


Future<void> addDetail2of3(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .collection("receipt_detail")
      .add({
    'created_at': Timestamp.now(),
    'food_cal': 42,
    'food_salt': 2.5,
    'food_protein': 2.9,
    'food_lipid': 0.9,
    'food_carbohydrate': 5.6,
    'food_dietary_fiber': 0.0,
    'food_sugar': 0.0,
    'food_id': 556,
    'food_name': "なめこ汁",
    'food_price': 100,
    'food_tax': 10,
    'receipt_id': 4,
    'user_id': 1,
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}



Future<void> addreceipt4(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .set({
    'created_at': Timestamp.now(),
    'receipt_id': 3,
    'restaurant_address': "岐阜県大垣市渋谷町6丁目",
    'restaurant_id': 69,
    'restaurant_name': "コンビニ24",
    'restaurant_phone': "044-777-7777",
    'restaurant_post_num': "777-7777",
    'user_id': 1
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add : $error"));
}

Future<void> addDetail1of4(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .collection("receipt_detail")
      .add({
    'created_at': Timestamp.now(),
    'food_cal': 27,
    'food_salt': 0.3,
    'food_protein': 1.7,
    'food_lipid': 1.7,
    'food_carbohydrate': 5.8,
    'food_dietary_fiber': 3.2,
    'food_sugar': 2.6,
    'food_id': 671,
    'food_name': "わかめサラダ",
    'food_price': 240,
    'food_tax': 24,
    'receipt_id': 5,
    'user_id': 1,
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}


Future<void> addDetail2of4(String randomStr) {
  // Call the user's CollectionReference to add a new user
  return fbfs.collection("receipt")
      .doc(randomStr)
      .collection("receipt_detail")
      .add({
    'created_at': Timestamp.now(),
    'food_cal': 150,
    'food_salt': 0,
    'food_protein': 0.8,
    'food_lipid': 6.6,
    'food_carbohydrate': 22,
    'food_dietary_fiber': 0.2,
    'food_sugar': 21.8,
    'food_id': 1001,
    'food_name': "いちごクリーム大福",
    'food_price': 150,
    'food_tax': 15,
    'receipt_id': 5,
    'user_id': 1,
  })
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}


void addData1(){
  String randomStr = randomString(20);
  addreceipt1(randomStr);
  addDetail1of1(randomStr);
}


void addData2(){
  String randomStr = randomString(20);
  addreceipt2(randomStr);
  addDetail1of2(randomStr);
  addDetail2of2(randomStr);
}

void addData3(){
  String randomStr = randomString(20);
  addreceipt3(randomStr);
  addDetail1of3(randomStr);
  addDetail2of3(randomStr);
}

void addData4(){
  String randomStr = randomString(20);
  addreceipt4(randomStr);
  addDetail1of4(randomStr);
  addDetail2of4(randomStr);
}
