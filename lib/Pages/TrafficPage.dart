import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ncov2019/Sidebar.dart';

class TrafficPage extends StatefulWidget {
  @override
  _TrafficPageState createState() => _TrafficPageState();
}

class _TrafficPageState extends State<TrafficPage> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('同行程查询', textAlign: TextAlign.center,),
        centerTitle: true,
        actions: <Widget>[ //导航后面的图标
          IconButton(icon: Icon(Icons.refresh,),
              onPressed: () {
                webView.reload();
              }
          ),
          IconButton(icon: Icon(Icons.arrow_back,),
              onPressed: () {
                if (webView != null) {
                  webView.goBack();
                }
              }
          ),
          IconButton(icon: Icon(Icons.arrow_forward,),
              onPressed: () {
                if (webView != null) {
                  webView.goForward();
                }
              }
          ),
        ],
      ),
      body: Container(
          child: Column(children: <Widget>[
            Container(
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container()),
            Expanded(
              child: Container(
                child: InAppWebView(
                  initialUrl: "http://2019ncov.nosugartech.com/",
                  initialHeaders: {},
                  initialOptions: InAppWebViewWidgetOptions(
                      inAppWebViewOptions: InAppWebViewOptions(
                        debuggingEnabled: true,
                      )),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                  },
                  onLoadStart: (InAppWebViewController controller,
                      String url) {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onLoadStop:
                      (InAppWebViewController controller, String url) async {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
          ])),
      drawer: Builder(
        builder: (context) =>
            Drawer(
              child: Sidebar(),
            ),

      ),
    );
  }
}
