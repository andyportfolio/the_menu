import 'package:flutter/material.dart';
import 'package:work_menupan/model/restaurant.dart';
import 'package:work_menupan/screens/home/adv_webview.dart';

import '../../constant.dart';

/// 업소의 메뉴판을 가져온다.
/// 전화걸기 기능 및 딜리버리앱 연결을 제공한다.
/// 광고기능을 넣어서 광고페이지를 호출한다.
class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen(this.restaurant);

  @override
  _RestaurantScreen createState() => _RestaurantScreen();
}

class _RestaurantScreen extends State<RestaurantScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.restaurant.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              //restaurant web view 호출

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdvWebView(
                      widget.restaurant.title, widget.restaurant.url),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        child: Text('메뉴판이 나와야 함'),
      ),
    );
  }
}
