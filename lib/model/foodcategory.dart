import 'package:flutter/material.dart';

class FoodCategory {
  final int id;
  final String name;

  FoodCategory({this.id, this.name});
}

String cat0Kr,cat1Kr,cat2Kr,cat3Kr,cat4Kr,cat5Kr,cat6Kr,cat7Kr,cat8Kr;
String cat0En,cat1En,cat2En,cat3En,cat4En,cat5En,cat6En,cat7En,cat8En;

//한식,중식/면,분식,일식,치킨,밀키트,패스트푸드,피자/양식,카페/디저트
List<FoodCategory> foodcategory = [
  FoodCategory(id: 0, name: cat0Kr),
  FoodCategory(id: 1, name: cat1Kr),
  FoodCategory(id: 2, name: cat2Kr),
  FoodCategory(id: 3, name: cat3Kr),
  FoodCategory(id: 4, name: cat4Kr),
  FoodCategory(id: 5, name: cat5Kr),
  FoodCategory(id: 6, name: cat6Kr),
  FoodCategory(id: 7, name: cat7Kr),
  FoodCategory(id: 8, name: cat8Kr)
];

List foodcategorytabs = [
  Tab(icon: Text(foodcategory[0].name)),
  Tab(icon: Text(foodcategory[1].name)),
  Tab(icon: Text(foodcategory[2].name)),
  Tab(icon: Text(foodcategory[3].name)),
  Tab(icon: Text(foodcategory[4].name)),
  Tab(icon: Text(foodcategory[5].name)),
  Tab(icon: Text(foodcategory[6].name)),
  Tab(icon: Text(foodcategory[7].name)),
  Tab(icon: Text(foodcategory[8].name))
];

//Korean,Chinese/Noodle,Casual,Japanese,Chicken,Meal Kit,Fast Food,Pizza,Coffee/Dessert
List<FoodCategory> foodcategory_en = [
  FoodCategory(id: 0, name: cat0En),
  FoodCategory(id: 1, name: cat1En),
  FoodCategory(id: 2, name: cat2En),
  FoodCategory(id: 3, name: cat3En),
  FoodCategory(id: 4, name: cat4En),
  FoodCategory(id: 5, name: cat5En),
  FoodCategory(id: 6, name: cat6En),
  FoodCategory(id: 7, name: cat7En),
  FoodCategory(id: 8, name: cat8En)
];

List foodcategorytabs_en = [
  Tab(icon: Text(foodcategory_en[0].name)),
  Tab(icon: Text(foodcategory_en[1].name)),
  Tab(icon: Text(foodcategory_en[2].name)),
  Tab(icon: Text(foodcategory_en[3].name)),
  Tab(icon: Text(foodcategory_en[4].name)),
  Tab(icon: Text(foodcategory_en[5].name)),
  Tab(icon: Text(foodcategory_en[6].name)),
  Tab(icon: Text(foodcategory_en[7].name)),
  Tab(icon: Text(foodcategory_en[8].name))
];