import 'dart:io';

import 'package:flutter/material.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:github_user_repos/utils/AppConstant.dart';
import 'package:github_user_repos/widgets/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {

  String url , title;
  WebViewScreen(this.url , this.title);

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {

  // this page only opens this (widget.url) as a web page in our application

  @override
  void initState() {
    super.initState();
    print(widget.url);
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(widget.title , textColor: secondaryTextColor, isBold: true, fontSize: textSizeLargeMedium, ),
        backgroundColor: primaryBackgroundColor,
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}