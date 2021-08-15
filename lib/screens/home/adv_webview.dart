import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AdvWebView extends StatefulWidget {
  AdvWebView(this.title, this.advUrl);

  final String advUrl;
  final String title;

  @override
  _AdvWebViewState createState() => _AdvWebViewState();
}

class _AdvWebViewState extends State<AdvWebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.advUrl,
      appBar: new AppBar(
        title: Text('The Order > ${widget.title}'),
        centerTitle: false,
      ),
      withZoom: true,
      withLocalStorage: true,
      scrollBar: true,
      withJavascript: true,
      initialChild: Center(child: Text('Loading...')),
    );
    //https://dev.to/techwithsam/flutter-webview-tutorial-1-convert-a-website-to-an-app-using-flutter-2ppd

    // return Scaffold(
    //     appBar: AppBar(
    //       elevation: 0,
    //       title: Text('The Order > ${widget.title}' ),
    //       centerTitle: false,
    //     ),
    //     body: WebView(
    //       initialUrl: widget.advUrl,
    //       javascriptMode: JavascriptMode.unrestricted,
    //     ));
  }
}
