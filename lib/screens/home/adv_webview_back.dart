import 'package:flutter/material.dart';

class AdvWebView2 extends StatefulWidget {
  AdvWebView2(this.title,this.advUrl);

  final String advUrl;
  final String title;

  @override
  _AdvWebViewState2 createState() => _AdvWebViewState2();
}

class _AdvWebViewState2 extends State<AdvWebView2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('The Order > ${widget.title}' ),
          centerTitle: false,
        ));
        // body: WebView(
        //   initialUrl: widget.advUrl,
        //   javascriptMode: JavascriptMode.unrestricted,
        // ));
  }
}
