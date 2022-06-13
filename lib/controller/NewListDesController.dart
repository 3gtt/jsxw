import 'dart:async';
import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../model/new_list_comment_model.dart';
import '../model/new_list_des_model.dart';
import '../r.g.dart';

class NewListDesController extends GetxController {
  WebViewController? controller;
  final webViewHeight = 0.0.obs;
  double webViewHeightIdEnt = Get.height;
  final isShowWebMore = false.obs;

  var testStr = "";
  var newListDesModels = [ListDesModel(feedback: null, newListDesModel: null), ListDesModel(feedback: null, newListDesModel: null, isNoMore: false, page: 1)].obs;



  @override
  void onInit() {
    super.onInit();
    request((value) {
        String htmlStr = newListDesModels[0].newListDesModel?.data.webContent ?? "";
        controller?.loadHtmlString(htmlStr);
    });
  }

  void loadMoreCommentModels(var callBack) {
    Dio().post("http://api.wap.miercn.com/api/apps/index.php", queryParameters: {
      "action": "cms_list_new",
      "aid": Get.arguments["id"].toString(),
      "apiCode": "7",
      "app_id": "1",
      "app_version": "2.6.8",
      "controller": "feedback",
      "device_uuid": "9757c829-6b1c-27ac-e936-d03f129e05cb",
      "order_type" : "time",
      "os_version": "iPhone%2C10.3",
      "page" : "${newListDesModels[1].page ?? 1}",
      "plat": "ios",
      "user_id": "0",
      "versioncode": "20180502",
    }).then((responds) {
      var jsonStr = responds.toString();
      Logger().d(jsonStr);
      var jsObj = json.decode(jsonStr);
      if (newListDesModels[1].feedback == null) {
        newListDesModels[1].feedback = NewListCommentModel.fromJson(jsObj);
        newListDesModels[1].page = (newListDesModels[1].page ?? 0) + 1;
      } else {
        List<CommentList> comments = NewListCommentModel.fromJson(jsObj).data.commentList;
        if (comments.isEmpty){
          newListDesModels[1].isNoMore = true;
        } else {
          newListDesModels[1].page = (newListDesModels[1].page ?? 0) + 1;
          newListDesModels[1].feedback?.data.commentList.insertAll(newListDesModels[1].feedback?.data.commentList.length ?? 0, comments);
        }
      }
      newListDesModels.refresh();
      callBack();
    });
  }

  void request(var callBack) {
      Dio().post("http://api.wap.miercn.com/api/apps/index.php", queryParameters : {
        "action" : "details",
        "aid" : Get.arguments["id"].toString(),
        "apiCode" : "7",
        "apiVersion" : "v1",
        "app_id" : "1",
        "app_version" : "2.6.8",
        "controller" : "Article",
        "device_uuid" : "9757c829-6b1c-27ac-e936-d03f129e05cb",
        "os_version" : "iPhone%2C10.3",
        "plat" : "ios",
        "user_id" : "0",
        "versioncode" : "20180502",
      }).then((responds) {
        var jsonStr = responds.toString();
        Logger().d(jsonStr);
        /// '0.0001'.replaceFirst(RegExp(r'0'), ''); // '.0001'
        var jsObj = json.decode(jsonStr);
        newListDesModels[0].newListDesModel = NewListDesModel.fromJson(jsObj);
        R.text.testhtml_json().then((htmlStr) {
          R.text.jshtml_json().then((jsStr) {
            String tmpStr = "$htmlStr $jsStr";
            Logger().d(newListDesModels[0].newListDesModel?.data.webContent);
            String webContent = tmpStr.replaceFirst(RegExp('<body>'), "<body>${newListDesModels[0].newListDesModel?.data.webContent}");
            newListDesModels[0].newListDesModel?.data.webContent = webContent;
            newListDesModels.refresh();
            callBack("111");
          });
        });
      });
  }
}

class ListDesModel {

  ListDesModel({this.feedback, this.newListDesModel, this.isNoMore, this.page});
  NewListCommentModel? feedback;
  NewListDesModel? newListDesModel;
  bool? isNoMore = false;
  int? page = 1;
}