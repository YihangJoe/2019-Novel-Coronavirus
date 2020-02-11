import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ncov2019/route.dart';
import 'package:ncov2019/Sidebar.dart';

Future main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,   //去掉Debug图标
      theme: ThemeData(
          primarySwatch: Colors.indigo
      ),
      onGenerateRoute: onGenerateRoute,
      home: Scaffold(
        appBar: AppBar(
          title: Text('2019-nCoV今日疫情', textAlign: TextAlign.center,),
          centerTitle: true,
          actions: <Widget>[                            //导航后面的图标
            IconButton(icon: Icon(Icons.refresh,),
                onPressed: () {
                  webView.reload();
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
                    initialUrl: "https://voice.baidu.com/act/newpneumonia/newpneumonia/?from=osari_pc_3#tab0",
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
      ),
    );
  }
}