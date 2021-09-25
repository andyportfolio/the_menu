import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

  //에러 코드를 받아서 에러 코드별 분기를 알려준다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('appTitle').tr(),
        centerTitle: false,
      ),
      body: Center(
        child: Text('error_msg').tr(),
      ),
    );
  }

}