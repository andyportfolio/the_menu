import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:menupan/model/restaurant.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Future<void> _launched;
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  //https://pub.dev/packages/url_launcher/example
  //open web broser
  //webview 내에 있는 url을 변경할수 없어서, web brower를 별도로 띄움.
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
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
          widget.restaurant.homepage.isNotEmpty
              ? _getHomePageInfo()
              : Container()
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
              label: Text(widget.restaurant.telephone),
              icon: Icon(Icons.call),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: kPrimaryColor,
                onSurface: kPrimaryColor,
              ),
              onPressed: () {
                launch("tel://" + widget.restaurant.telephone);
              }),
        ),
      ],
    );
  }

  IconButton _getHomePageInfo() {
    return IconButton(
      icon: Icon(Icons.info),
      onPressed: () {
        setState(() {
          _launched = _launchInBrowser(widget.restaurant.homepage);
        });
      },
    );
  }
}
