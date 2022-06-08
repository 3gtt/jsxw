import 'dart:async';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:com_3gtt_jsxw/controller/JSWebViewController.dart';


class WebViewPage extends StatelessWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("搜索运20"),
          previousPageTitle: "运20",
          // trailing: ,
        ),
        child: SafeArea(
          child: GetBuilder(
              init: JSWebViewController(),
              builder: (context) {
                return const WebWidget();
              }),
        ));
  }
}
class WebWidget extends StatefulWidget {
  const WebWidget({Key? key}) : super(key: key);

  @override
  State<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget>  with SingleTickerProviderStateMixin {
  final url = "https://www.baidu.com/s?wd=%E8%BF%9020";
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  CookieManager? cookieManager;

  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    )..forward();

  }
  @override
  Widget build(BuildContext context) {
    JSWebViewController c = Get.find<JSWebViewController>();
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onWebResourceError: (error) {
              c.visible.value = false;
              Get.showSnackbar(GetSnackBar(message: error.description));
            },
            onPageFinished: (url) {
              c.visible.value = false;
            },
            onPageStarted: (url) {
              c.visible.value = true;
            },
            onProgress: (progress) {
              Logger().d(progress);
              c.progress.value = (progress / 100.0);
            },
          ),
          Obx(() => Visibility(visible: c.visible.value, child: LinearProgressIndicator(value: c.progress.value))),
        ],
      ),
    );
  }
}
