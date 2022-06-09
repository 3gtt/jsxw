
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/SearchArsenalPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/ArsenalListPage.dart';
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/AllArsenalListPage.dart';
import 'package:com_3gtt_jsxw/pages/ranklistpage/RankListPage.dart';
import 'package:com_3gtt_jsxw/pages/ranklistpage/RankLevelListPage.dart';
import 'package:com_3gtt_jsxw/pages/JSHomePage.dart';
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/ArsenalDesPage.dart';
import '../pages/feedback/FeedBackPage.dart';
import '../pages/webwidget/WebViewPage.dart';
class RouteManager {

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/' : (context) => const JSHomePage(),
      "/ArsenalListPage" : (context) => const ArsenalListPage(),
      "/AllArsenalListPage" : (context) => const AllArsenalListPage(),
      "/SearchArsenalPage" : (context) => const SearchArsenalPage(),
      "/ArsenalDesPage" : (context) => ArsenalDesPage(),
      "/FeedBackPage" : (context) => const FeedBackPage(),
      "/WebViewPage" : (context) => const WebViewPage(),
      "/RankListPage" : (context) => const RankListPage(),
      "/RankLevelListPage" : (context) => const RankLevelListPage(),
    };
  }

  static void jumpArsenalListPage([var arguments]) {
    Get.toNamed("/ArsenalListPage", arguments: arguments);
  }

  static void jumpAllArsenalListPage([var arguments]) {
    Get.toNamed("/AllArsenalListPage", arguments: arguments);
  }

  static void jumpSearchArsenalPage([var arguments]) {
    Get.toNamed("/SearchArsenalPage", arguments:  arguments);
  }

  static void jumpArsenalDesPage([var arguments]) {
    Get.toNamed("/ArsenalDesPage", arguments: arguments);
  }

  static void jumpFeedBackPage([var arguments]) {
    Get.toNamed("/FeedBackPage", arguments: arguments);
  }

  static void jumpRankListPage([var arguments]) {
    Get.toNamed("/RankListPage", arguments: arguments);
  }

  static void jumpRankLevelListPage([var arguments]) {
    Get.toNamed("/RankLevelListPage", arguments: arguments);
  }

}