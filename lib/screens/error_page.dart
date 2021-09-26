import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String err;

  ErrorPage({this.err});

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
        child: getBody(),
      ),
    );
  }

  Widget getBody() {

    //print("widget.err : ${widget.err}");

    switch (widget.err) {
      case 'timeout':
        return Text('error_timeout').tr();
        break;
      case 'connection':
        return Text('error_connection').tr();
        break;
      default:
        return Text('error_msg').tr();
    }
  }
}
