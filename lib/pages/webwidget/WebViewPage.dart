import 'dart:async';
import 'dart:convert';
import 'package:com_3gtt_jsxw/common/GlobalVariable.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;


class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);
  final url = "https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=02003390_25_hao_pg&wd=%E8%BF%9020&fenlei=256&rsv_pq=fd2f469600011dfd&rsv_t=a7b1Awh5uBiBP%2B%2FB060RbppXMWlQ4YctQ4k%2Fez75YhmdUyVJJ3do1Uor0iB4%2BD2mLEvu9%2BEa%2BDDH&rqlang=cn&rsv_enter=1&rsv_dl=tb&rsv_sug3=8&rsv_sug1=10&rsv_sug7=100&rsv_sug2=0&rsv_btype=i&prefixsug=%25E8%25BF%259020&rsp=6&inputT=3433&rsv_sug4=3960";

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  CookieManager? cookieManager;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    Future.delayed(const Duration(seconds: 2)).then((value) {

    });
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: const Text("搜索运20"),
          previousPageTitle: "运20",
          trailing: Material( child: SampleMenu(_controller.future, cookieManager)),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
            ) ,
          ),
        )
    );
  }
}
enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
}

class SampleMenu extends StatelessWidget {
  SampleMenu(this.controller, CookieManager? cookieManager, {Key? key})
      : cookieManager = cookieManager ?? CookieManager(),
        super(key: key);

  final Future<WebViewController> controller;
  late final CookieManager cookieManager;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        return PopupMenuButton<MenuOptions>(
          key: const ValueKey<String>('ShowPopupMenu'),
          onSelected: (MenuOptions value) {
            switch (value) {
              case MenuOptions.showUserAgent:
                _onShowUserAgent(controller.data!, context);
                break;
              case MenuOptions.listCookies:
                _onListCookies(controller.data!, context);
                break;
              case MenuOptions.clearCookies:
                _onClearCookies(context);
                break;
              case MenuOptions.addToCache:
                _onAddToCache(controller.data!, context);
                break;
              case MenuOptions.listCache:
                _onListCache(controller.data!, context);
                break;
              case MenuOptions.clearCache:
                _onClearCache(controller.data!, context);
                break;
              case MenuOptions.navigationDelegate:
                _onNavigationDelegateExample(controller.data!, context);
                break;
              case MenuOptions.doPostRequest:
                _onDoPostRequest(controller.data!, context);
                break;
              case MenuOptions.loadLocalFile:
                _onLoadLocalFileExample(controller.data!, context);
                break;
              case MenuOptions.loadFlutterAsset:
                _onLoadFlutterAssetExample(controller.data!, context);
                break;
              case MenuOptions.loadHtmlString:
                _onLoadHtmlStringExample(controller.data!, context);
                break;
              case MenuOptions.transparentBackground:
                _onTransparentBackground(controller.data!, context);
                break;
              case MenuOptions.setCookie:
                _onSetCookie(controller.data!, context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
            PopupMenuItem<MenuOptions>(
              value: MenuOptions.showUserAgent,
              enabled: controller.hasData,
              child: const Text('Show user agent'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCookies,
              child: Text('List cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCookies,
              child: Text('Clear cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.addToCache,
              child: Text('Add to cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCache,
              child: Text('List cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCache,
              child: Text('Clear cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.navigationDelegate,
              child: Text('Navigation Delegate example'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.doPostRequest,
              child: Text('Post Request'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.loadHtmlString,
              child: Text('Load HTML string'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.loadLocalFile,
              child: Text('Load local file'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.loadFlutterAsset,
              child: Text('Load Flutter Asset'),
            ),
            const PopupMenuItem<MenuOptions>(
              key: ValueKey<String>('ShowTransparentBackgroundExample'),
              value: MenuOptions.transparentBackground,
              child: Text('Transparent background example'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.setCookie,
              child: Text('Set cookie'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onShowUserAgent(
      WebViewController controller, BuildContext context) async {
    // Send a message with the user agent string to the Toaster JavaScript channel we registered
    // with the WebView.
    await controller.runJavascript(
        'Toaster.postMessage("User Agent: " + navigator.userAgent);');

  }

  Future<void> _onListCookies(
      WebViewController controller, BuildContext context) async {
    final String cookies =
    await controller.runJavascriptReturningResult('document.cookie');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Cookies:'),
          _getCookieList(cookies),
        ],
      ),
    ));
  }

  Future<void> _onAddToCache(
      WebViewController controller, BuildContext context) async {
    await controller.runJavascript(
        'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added a test entry to cache.'),
    ));
  }

  Future<void> _onListCache(
      WebViewController controller, BuildContext context) async {
    await controller.runJavascript('caches.keys()'
    // ignore: missing_whitespace_between_adjacent_strings
        '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
        '.then((caches) => Toaster.postMessage(caches))');
  }

  Future<void> _onClearCache(
      WebViewController controller, BuildContext context) async {
    await controller.clearCache();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Cache cleared.'),
    ));
  }

  Future<void> _onClearCookies(BuildContext context) async {
    final bool hadCookies = await cookieManager.clearCookies();
    String message = 'There were cookies. Now, they are gone!';
    if (!hadCookies) {
      message = 'There are no cookies.';
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<void> _onNavigationDelegateExample(
      WebViewController controller, BuildContext context) async {
    // final String contentBase64 =
    // base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    // await controller.loadUrl('data:text/html;base64,$contentBase64');
  }

  Future<void> _onSetCookie(
      WebViewController controller, BuildContext context) async {
    await cookieManager.setCookie(
      const WebViewCookie(
          name: 'foo', value: 'bar', domain: 'httpbin.org', path: '/anything'),
    );
    await controller.loadUrl('https://httpbin.org/anything');
  }

  Future<void> _onDoPostRequest(
      WebViewController controller, BuildContext context) async {
    // final WebViewRequest request = WebViewRequest(
    //   uri: Uri.parse('https://httpbin.org/post'),
    //   method: WebViewRequestMethod.post,
    //   headers: <String, String>{'foo': 'bar', 'Content-Type': 'text/plain'},
    //   body: Uint8List.fromList('Test Body'.codeUnits),
    // );
    // await controller.loadRequest(request);
  }

  Future<void> _onLoadLocalFileExample(
      WebViewController controller, BuildContext context) async {
    // final String pathToIndex = await _prepareLocalFile();
    //
    // await controller.loadFile(pathToIndex);
  }

  Future<void> _onLoadFlutterAssetExample(
      WebViewController controller, BuildContext context) async {
    await controller.loadFlutterAsset('assets/www/index.html');
  }

  Future<void> _onLoadHtmlStringExample(
      WebViewController controller, BuildContext context) async {
    // await controller.loadHtmlString(kLocalExamplePage);
    await controller.runJavascript("var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);");
  }

  Future<void> _onTransparentBackground(
      WebViewController controller, BuildContext context) async {
    // await controller.loadHtmlString(kTransparentBackgroundPage);
  }

  Widget _getCookieList(String cookies) {
    if (cookies == null || cookies == '""') {
      return Container();
    }
    final List<String> cookieList = cookies.split(';');
    final Iterable<Text> cookieWidgets =
    cookieList.map((String cookie) => Text(cookie));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: cookieWidgets.toList(),
    );
  }

  // static Future<String> _prepareLocalFile() async {
  //   final String tmpDir = (await getTemporaryDirectory()).path;
  //   final File indexFile = File(
  //       <String>{tmpDir, 'www', 'index.html'}.join(Platform.pathSeparator));
  //
  //   await indexFile.create(recursive: true);
  //   await indexFile.writeAsString(kLocalExamplePage);
  //
  //   return indexFile.path;
  // }
}