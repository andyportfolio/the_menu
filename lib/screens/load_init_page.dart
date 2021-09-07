import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_overlay/loading_overlay.dart';
import 'package:menupan/model/config.dart';
import 'package:menupan/model/event.dart';
import 'package:menupan/model/foodcategory.dart';
import 'package:menupan/model/restaurant.dart';
import 'package:package_info/package_info.dart';

import 'error_page.dart';
import 'home/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class LoadInitPage extends StatefulWidget {
  final String countryCode;
  LoadInitPage(this.countryCode);

  @override
  _LoadInitPageState createState() => _LoadInitPageState();
}

class _LoadInitPageState extends State<LoadInitPage> {
  // manage state of modal progress HUD widget
  bool _isLoading = false;
  String _minVersion;
  String _latestVersion;

  String _categoryKr;
  String _categoryEn;

  //config 및 업소 리스트를 가져온다.
  final String accessURL = "https://www.mosoft.ca/tm/api/tm/getinit";

  @override
  void initState() {
    super.initState();
    _getInitAsync();
  }

  void _getInitAsync() async {
    bool status = false;
    String versionStatus; //G(Good) , R(Recommend)  , U(update 필요)

    // start the modal progress HUD
    setState(() {
      _isLoading = true;
    });

    status = await _getInit(widget.countryCode);

    // stop the modal progress HUD
    setState(() {
      _isLoading = false;
    });

    if (status) {
      //버젼을 비교하여 alert만 뜨게 하거나
      //강제로 version up을 하게 하는 페이지로 이동하게 한다.
      versionStatus = await _versionCheck();
      _goToHomeScreen(versionStatus);
    } else {
      _goToErrorPage();
    }
  }

  Future<String> _versionCheck() async {
    String _versionStatus = "G"; //default G(Good)

    PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
    );

    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });

    print("App name: ${_packageInfo.appName}");
    print('Package name:  ${_packageInfo.packageName}');
    print('App version:  ${_packageInfo.version}');
    print('Build number:  ${_packageInfo.buildNumber}');

    String  currentVersion = _packageInfo.buildNumber;

    // 사용중인 유저의 앱의 버전은 반드시 최소로 요구되는 버전보다 크거나 같아야 하고 최신 버전 이하여야 한다.
    // minimumVersion <= currentVersion <= LatestVersion

    //현재 버전 이 최소버젼 보다 작으면 update 해야 함.
    if (int.parse(currentVersion) < int.parse(_minVersion)) {
      return _versionStatus = 'U'; //update
    } else if (int.parse(currentVersion) < int.parse(_latestVersion)) {
      //현재 버전이 최근 버전보다 작으면 recommend 하게 한다.
      return _versionStatus = 'R'; //recommend
    } else {
      return _versionStatus; // G : do nothing
    }
  }

  Future<bool> _getInit(String countryCode) async {
    bool status = false;

    http.Response response = await http.post(
      accessURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },body: jsonEncode({'countryCode': countryCode}));

    print("countryCode: $countryCode");
    print("response.statusCode: ${response.statusCode}");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      //print("jsonResponse: $jsonResponse");

      final ResData parsedData = ResData.fromJson(jsonResponse);

      //set config
      configs = null;
      configs = <Config>[];
      configs = List.from(parsedData.configs);
      //configs.addAll(parsedData.configs);

      //set rootURL
      for (var config in configs) {
        if (config.type == 'URL') {
          rootURL = config.config1;
        }

        if (config.type == 'VER') {
          _minVersion = config.config1;
          _latestVersion = config.config2;
        }

        //category
        if (config.type == 'CAT') {
          _categoryKr = config.config1;
          _categoryEn = config.config2;
        }
      }

      print("_minVersion: $_minVersion");
      print("_latestVersion: $_latestVersion");

      print("_categoryKr: $_categoryKr");
      print("_categoryEn: $_categoryEn");

      //set categories
      List<String> tmpCategoryKr = _categoryKr.split(',');
      cat0Kr = tmpCategoryKr[0];
      cat1Kr = tmpCategoryKr[1];
      cat2Kr = tmpCategoryKr[2];
      cat3Kr = tmpCategoryKr[3];
      cat4Kr = tmpCategoryKr[4];
      cat5Kr = tmpCategoryKr[5];
      cat6Kr = tmpCategoryKr[6];
      cat7Kr = tmpCategoryKr[7];
      cat8Kr = tmpCategoryKr[8];

      List<String> tmpCategoryEn = _categoryEn.split(',');
      cat0En = tmpCategoryEn[0];
      cat1En = tmpCategoryEn[1];
      cat2En = tmpCategoryEn[2];
      cat3En = tmpCategoryEn[3];
      cat4En = tmpCategoryEn[4];
      cat5En = tmpCategoryEn[5];
      cat6En = tmpCategoryEn[6];
      cat7En = tmpCategoryEn[7];
      cat8En = tmpCategoryEn[8];


      //set product
      restaurants = null;
      restaurants = <Restaurant>[];
      restaurants = List.from(parsedData.restaurants);

      //set event
      events = null;
      events = <Event>[];
      events = List.from(parsedData.events);

      status = parsedData.status;
    }

    return status;
  }

  void _goToHomeScreen(String versionStatus) {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(versionStatus: versionStatus),
        ),
      );
    });
  }

  void _goToErrorPage() {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ErrorPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // display modal progress HUD (heads-up display, or indicator)
    // when in async call
    return LoadingOverlay(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('appTitle').tr(),
          centerTitle: false,
        ),
        body: Center(
          child: Text('loadingMessage').tr(),
        ),
      ),
      isLoading: _isLoading,
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(),
    );
  }
}

class ResData {
  final String sql;
  final bool status;
  final List<Config> configs;
  final List<Restaurant> restaurants;
  final List<Event> events;

  ResData({this.sql, this.status, this.configs, this.restaurants, this.events});

  factory ResData.fromJson(Map<String, dynamic> json) {
    var list = json['configs'] as List;
    List<Config> configList = list.map((i) => Config.fromJson(i)).toList();

    var list2 = json['restaurants'] as List;
    List<Restaurant> restaurantList = list2.map((i) => Restaurant.fromJson(i)).toList();

    var list3 = json['events'] as List;
    List<Event> eventList = list3.map((i) => Event.fromJson(i)).toList();

    return ResData(
        sql: json['sql'],
        status: json['status'],
        configs: configList,
        restaurants: restaurantList,
        events: eventList);
  }

  @override
  String toString() {
    return 'ResData{sql: $sql, status: $status ,'
        'configs: $configs ,restaurants: $restaurants ,events: $events}';
  }
}
