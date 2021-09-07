import 'package:flutter/material.dart';
import 'package:menupan/constant.dart';

import 'components/advertisement.dart';
import 'components/food_category.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: ListView(
        children: <Widget>[
          Advertisement(),
          SizedBox(height: 10,),
          FoodCategory(),
          //_buildMiddle2(),
          //_buildBottom(),
        ],
      ),
    );
  }
}
