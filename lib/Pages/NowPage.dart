import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ncov2019/Sidebar.dart';

class NowPage extends StatefulWidget {
  @override
  _NowPageState createState() => _NowPageState();
}

class _NowPageState extends State<NowPage> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新进展', textAlign: TextAlign.center,),
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
                  initialUrl: "https://quark.sm.cn/api/rest?method=news.eventlist&format=html&schema=v2&uc_param_str=dnntnwvepffrgibijbprsvpidsdichei&dn=54694011714-2caf4d13&nt=1&ve=3.8.1.125&pf=3300&fr=android&bi=35823&pr=ucpro&sv=release&pi=1080x1800&ds=bTkwACqdXJGmBKyyqAHv7fhuNvviJGKoZo%2BZxR7iJkZQog%3D%3D&from=kkframenew&q=%E6%96%B0%E5%9E%8B%E8%82%BA%E7%82%8E%E6%9C%80%E6%96%B0%E8%BF%9B%E5%B1%95",
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
