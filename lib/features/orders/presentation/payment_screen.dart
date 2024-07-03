import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'package:graduation_project/styles/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/constant/components/components.dart';
import '../../../core/utils/toast.dart';
import '../../home_page/home_page.dart';

String? status;
class WebViewApp extends StatefulWidget {

  String url ;
  WebViewApp(this.url);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print("the current page is $url");
          },
          onPageFinished: (String url) {
            print("after finsih is $url");
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {

            if (request.url.startsWith('https://checkout.stripe.com/c/pay')) {
              Uri uri = Uri.parse(request.url);
              status = uri.queryParameters['success'] ?? '';
              print(request.url);

              print("THA STATUS $status");
              if(status != '' || status != null )
              {
                print("in the method create order $status");
                showToast(text: 'تم انشاء الطلب بنجاح', state: ToastStates.success);

                print("finishhhhhhhhhhhhhhhhhhh");

              }
              else {
                // Handle the case where uri is null
                print("Error: Uri is null");
              }
              // route to home screen
              navigateFinish(context, const HomePage());

              return NavigationDecision.navigate;


            }
            print("finaaaal ");
            showToast(text: 'تم انشاء الطلب بنجاح', state: ToastStates.success);
CardCubit.get(context).products = [] ;
            navigateFinish(context, const HomePage());

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.url),
      );
    print('thiss is the link ${widget.url}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('الدفع',style: Styles.style14Bold,),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}