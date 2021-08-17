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
  void initState() {
    // TODO: implement initState
    print("2222");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("333");
    //Navigator.pop(context);
    //print("4444");
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.advUrl,
      appBar: new AppBar(
        title: Text(widget.title),
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
