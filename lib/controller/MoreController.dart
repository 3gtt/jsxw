import 'package:get/get.dart';

class MoreController extends GetxController {

  final listModels = <MoreModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    createData();
  }


  void createData() {
    listModels.insertAll(0, [
      MoreModel(icon: "mine_apps", title: "良心App", isRightArrow: true, isGroup: false),
      MoreModel(icon: "mine_mark", title: "武器收藏夹", isRightArrow: true, isGroup: false),
      MoreModel(icon: "mine_mark", title: "武器阅读记录", isRightArrow: true, isGroup: true),
      MoreModel(icon: "mine_mark", title: "新闻收藏夹", isRightArrow: true, isGroup: false),
      MoreModel(icon: "mine_mark", title: "新闻阅读记录", isRightArrow: true, isGroup: true),
      MoreModel(icon: "mine_share", title: "告诉我们你想要的功能", isRightArrow: true, isGroup: false),
      MoreModel(icon: "mine_share", title: "分享给好友使用", isRightArrow: false, isGroup: true),
      MoreModel(icon: "", title: "v1.5.0", isRightArrow: false),
    ]);
  }

}

class MoreModel {
  MoreModel({this.icon, this.title, this.isRightArrow = false, this.isGroup = false});
  String? icon;
  String? title;
  bool isRightArrow;
  bool isGroup;
}