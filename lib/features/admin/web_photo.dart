import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'package:graduation_project/styles/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/constant/components/components.dart';
import '../../../core/utils/toast.dart';

String? status;
class PhotoViewApp extends StatefulWidget {

  String url ;
  PhotoViewApp(this.url);

  @override
  State<PhotoViewApp> createState() => _PhotoViewAppState();
}

class _PhotoViewAppState extends State<PhotoViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    String correctedUrl = widget.url.toLowerCase();
    if (!correctedUrl.startsWith('http://') && !correctedUrl.startsWith('https://')) {
      correctedUrl = 'https://' + correctedUrl;
    } else if (correctedUrl.startsWith('http://')) {
      correctedUrl = 'https://' + correctedUrl.substring(7);}
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            print("the current page is $url");
          },
          onPageFinished: (String url) {
            print("after finish is $url");
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;},),)
      ..loadRequest(
        Uri.parse(correctedUrl),
      );
    print('this is the link $correctedUrl');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultTheme
        (context: context, isReverse: true, title: 'الصورة النهائية'),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}