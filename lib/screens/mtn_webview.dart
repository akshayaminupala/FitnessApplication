import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MtnWebViewScreen extends StatefulWidget {
  static const id = 'mtn_webview';
  @override
  _MtnWebViewScreenState createState() => _MtnWebViewScreenState();
}

class _MtnWebViewScreenState extends State<MtnWebViewScreen> {
  InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: InAppWebView(
            initialUrl: "https://flutter.dev/",
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
