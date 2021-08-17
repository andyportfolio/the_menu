import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:menupan/model/restaurant.dart';
import 'package:menupan/screens/home/adv_webview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

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

  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    print("11111");
  }


  @override
  void dispose() {
    super.dispose();
    flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.restaurant.url,
      appBar: new AppBar(
        title: Text(widget.restaurant.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            )),
        actions: <Widget>[
          widget.restaurant.homepage.isNotEmpty ? _getHomePageInfo() : Container()
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      scrollBar: true,
      withJavascript: true,
      initialChild: Center(child: Text('Loading...')),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(12),
      //   child: Text('callToRestaurant'.tr(args: [widget.restaurant.telephone]) ),
      // ),
      persistentFooterButtons: [
        Center(
          child: TextButton.icon(
              label: Text('callToRestaurant'.tr(args: [widget.restaurant.telephone]) ),
              icon: Icon(Icons.call),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                launch("tel://" + widget.restaurant.telephone);
              }
          ),
        ),
        // IconButton(
        //   icon: const Icon(Icons.call),
        //   onPressed: () {
        //     launch("tel://4166179395");
        //   },
        // ),
        // CircleAvatar(
        //   backgroundColor: Colors.orange,
        //   child: Text('btn2'),
        // ),
        // CircleAvatar(
        //   backgroundColor: Colors.red,
        //   child: Text('btn3'),
        // ),
        // CircleAvatar(
        //   backgroundColor: Colors.grey[700],
        //   child: Text('btn4'),
        // ),
      ],

      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: <Widget>[
      //       IconButton(
      //         icon: const Icon(Icons.arrow_back_ios),
      //         onPressed: () {
      //           flutterWebViewPlugin.goBack();
      //         },
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.arrow_forward_ios),
      //         onPressed: () {
      //           flutterWebViewPlugin.goForward();
      //         },
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.autorenew),
      //         onPressed: () {
      //           flutterWebViewPlugin.reload();
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );

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

  IconButton _getHomePageInfo() {
      return IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          //restaurant home page 호출
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdvWebView(
                  widget.restaurant.title + ' Website', widget.restaurant.homepage),
            ),
          );
        },
      );
  }
}
