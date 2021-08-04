import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_overlay/loading_overlay.dart';
import 'package:work_menupan/model/config.dart';
import 'package:work_menupan/model/restaurant.dart';

import 'error_page.dart';
import 'home/home_screen.dart';

class LoadInitPage extends StatefulWidget {
  @override
  _LoadInitPageState createState() => _LoadInitPageState();
}

class _LoadInitPageState extends State<LoadInitPage> {
  // manage state of modal progress HUD widget
  bool _isLoading = false;
  
  //config 및 업소 리스트를 가져온다.
  final String accessURL = "https://www.mosoft.ca/tm/api/tm/getinit";

  @override
  void initState() {
    super.initState();
    _getInitAsync();
  }

  void _getInitAsync() async {
    bool status = false;

    // start the modal progress HUD
    setState(() {
      _isLoading = true;
    });

    status = await _getInit();

    // stop the modal progress HUD
    setState(() {
      _isLoading = false;
    });

    if (status) {
      _goToHomeScreen();
    } else {
      _goToErrorPage();
    }
  }

  Future<bool> _getInit() async {
    bool status = false;

    http.Response response = await http.post(
      accessURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print("response.statusCode: ${response.statusCode}");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      //print("jsonResponse: $jsonResponse");

      final ResData parsedData = ResData.fromJson(jsonResponse);

      //set config
      configs = null;
      configs = new List<Config>();
      configs = List.from(parsedData.configs);
      //configs.addAll(parsedData.configs);

      //set rootURL
      for(var config in configs) {
        if (config.type == 'URL') {
          rootURL = config.config1;
          break;
        }
      }

      //print("rootURL: $rootURL");

      //set product
      restaurants = null;
      restaurants = new List<Restaurant>();
      restaurants = List.from(parsedData.restaurants);
      //restaurants.addAll(parsedData.restaurants);

      //print("parsedData: ${parsedData.toString()}");

      //print("configs: ${configs.toString()}");
      //print("restaurants: ${restaurants.toString()}");

      status = parsedData.status;
    }

    return status;
  }

  void _goToHomeScreen() {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
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
          title: Text('The Menu'),
          centerTitle: false,
        ),
        body: Center(
          child: Text('기초 정보를 가져오고 있습니다. 잠시만 기다려주세요.'),
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

  ResData({this.sql, this.status, this.configs, this.restaurants});

  factory ResData.fromJson(Map<String, dynamic> json) {
    var list = json['configs'] as List;
    List<Config> configList = list.map((i) => Config.fromJson(i)).toList();

    var list2 = json['restaurants'] as List;
    List<Restaurant> restaurantList = list2.map((i) => Restaurant.fromJson(i)).toList();

    return ResData(
        sql: json['sql'], status: json['status'],
        configs: configList, restaurants: restaurantList);
  }

  @override
  String toString() {
    return 'ResData{sql: $sql, status: $status ,'
        'configs: $configs ,restaurants: $restaurants}';
  }
}
