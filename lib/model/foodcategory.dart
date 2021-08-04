import 'package:flutter/material.dart';

class FoodCategory {
  final int id;
  final String name;

  FoodCategory({this.id, this.name});
}

List<FoodCategory> foodcategory = [
  FoodCategory(id: 0, name: '한식'),
  FoodCategory(id: 1, name: '중식/면'),
  FoodCategory(id: 2, name: '분식'),
  FoodCategory(id: 3, name: '일식'),
  FoodCategory(id: 4, name: '치킨'),
  FoodCategory(id: 5, name: '족발'),
  FoodCategory(id: 6, name: '패스트푸드'),
  FoodCategory(id: 7, name: '피자/양식'),
  FoodCategory(id: 8, name: '카페/디저트')
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