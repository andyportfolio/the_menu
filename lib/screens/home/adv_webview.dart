import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdvWebView extends StatefulWidget {
  AdvWebView(this.title,this.advUrl);

  final String advUrl;
  final String title;

  @override
  _AdvWebViewState createState() => _AdvWebViewState();
}

class _AdvWebViewState extends State<AdvWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('The Order > ${widget.title}' ),
          centerTitle: false,
        ),
        body: WebView(
          initialUrl: widget.advUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
