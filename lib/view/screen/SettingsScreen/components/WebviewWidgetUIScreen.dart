import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/webviewscreenshow.dart';
import 'package:flutter/material.dart';

class WebviewWidgetUIScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebviewWidgetUIScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<WebviewWidgetUIScreen> createState() => _WebviewWidgetUIScreenState();
}

class _WebviewWidgetUIScreenState extends State<WebviewWidgetUIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(title: widget.title)),
        body: WebViewScreensShow(url: widget.url));
  }
}
