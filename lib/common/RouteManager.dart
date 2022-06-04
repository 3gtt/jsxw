import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/ArsenalListPage.dart';
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/AllArsenalListPage.dart';
import 'package:com_3gtt_jsxw/pages/JSHomePage.dart';

class RouteManager {

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/' : (context) => const JSHomePage(),
      "/ArsenalListPage" : (context) => const ArsenalListPage(),
      "/AllArsenalListPage" : (context) => const AllArsenalListPage(),
    };
  }

  static void jumpArsenalListPage([var arguments]) {
    Get.toNamed("/ArsenalListPage", arguments: arguments);
  }

  static void jumpAllArsenalListPage([var arguments]) {
    Get.toNamed("/AllArsenalListPage", arguments: arguments);
  }
}