import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../model/new_list_model.dart';

class MilitaryOnlineController extends GetxController{

  var currentIndex = 0.obs;
  var newListModels = <Data?>[].obs;
  var newNoMoreList = <NewListLoadMoreModel?>[].obs;


  @override
  void onInit() {
    super.onInit();
    newListModels.insertAll(0, [
      Data([]),
      Data([]),
      Data([]),
      Data([]),
      Data([]),
    ]);
    newNoMoreList.insertAll(0, [
      NewListLoadMoreModel(),
      NewListLoadMoreModel(),
      NewListLoadMoreModel(),
      NewListLoadMoreModel(),
      NewListLoadMoreModel(),
    ]);
  }

  void request(int index, bool isLoad, var callBack) async {
    int channel;
    if (index == 3) {
      channel = 5;
    } else if (index == 4) {
      channel = 4;
    } else {
      channel = index + 1;
    }

    if (isLoad) {
      newNoMoreList[index]?.page++;
    } else {
      newNoMoreList[index]?.page = 1;
      newListModels[index]?.newsLists.removeRange(0, newListModels[index]?.newsLists.length ?? 0);
    }

    try {
      var responds = await Dio().post("http://api.wap.miercn.com/api/apps/index.php", queryParameters : {
        "action" : "newslist",
        "apiCode" : "7",
        "apiVersion" : "v1",
        "app_id" : "1",
        "app_version" : "2.6.8",
        "channel" : "$channel",
        "controller" : "News",
        "device_uuid" : "9757c829-6b1c-27ac-e936-d03f129e05cb",
        "os_version" : "iPhone%2C10.3",
        "page" : "${newNoMoreList[index]?.page}",
        "plat" : "ios",
        "user_id" : "0",
        "versioncode" : "20180502",
      });
      var jsonStr = responds.data.toString();
      var jsObj = json.decode(jsonStr);
      var data = NewListModel.fromJson(jsObj).data;
      if (data.newsLists.isEmpty) {
        newNoMoreList[index]?.isNoMore = true;
      }
      newListModels[index]?.newsLists.insertAll(newListModels[index]?.newsLists.length ?? 0, data.newsLists);
      callBack(null);
    }
    catch (e){
      callBack(e);
      Logger().d(e);
    }
  }

}

class NewListLoadMoreModel {
  NewListLoadMoreModel({this.isNoMore = false, this.page = 1});
  bool isNoMore;
  int page;
}

