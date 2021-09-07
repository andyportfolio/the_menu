import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/Colors/grey-constant.html
const kPrimaryColor = Color(0xFF303030); //red Color(0xFFD50000); //blue : Color(0xFF035AA6);
const kSelectedItemColor = Color(0xFFFAFAFA); // colors.grey[50]
const kUnselectedItemColor = Color(0xFFBDBDBD); // colors.grey[400]

const kFoodTileColor = Color(0xFF303030); //

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);