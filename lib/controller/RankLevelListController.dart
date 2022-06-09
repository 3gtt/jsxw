import 'dart:convert';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/model/rank_list_model.dart';
import '../model/aircraft_model.dart';
import '../model/custom/hor_selector_model.dart';
import '../r.g.dart';
class RankLevelListController extends GetxController {
  // 初始值为1000 不让选中的状态
  static const noSelectedCount = 0;

  /// menu的动画
  var isShowMenu = false.obs;
  static double menuHeight = Get.size.height / 5 * 2;
  var animatedHeight = (-menuHeight).obs;


  /// menuList
  var menuTitles = <HorSelectorModel>[].obs;
  var menuSelectCurrentIndex = noSelectedCount.obs;

  /// ListItems
  var listModels = <RankListItemModel>[].obs;


  ///飞行器
  var rankLeftListModels = [].obs;
  var rankLeftCurrentIndex = noSelectedCount;

  ///飞行器
  var rankRightListModels = [].obs;
  var rankRightCurrentIndex = noSelectedCount;

  @override
  void onInit() {
    super.onInit();
    menuTitles.insertAll(0, [HorSelectorModel(title: "战斗机"), HorSelectorModel(title: "机长"),]);
    listModels.insertAll(0, [
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
      RankListItemModel(title:"1YF-12",img:"america_s", parameter: "30.97", tag: "米"),
    ]);
    _readAircraftJson();
    _readParameterJson();
  }

  void showMenuWidget(int index) {
    /// 下面是动画不需要动
    isShowMenu.value = true;
    Future.delayed(const Duration(milliseconds: 100)).then((value) => animatedHeight.value = 0);
    if (index == 0) {
      aircraftMenuShow(index);
    } else if (index == 1){
      parameterMenuShow(index);
    }

    /// 当menulist出现时需要将选择条选中的文字颜色改变
    cleanHorMenu();
    changeMenuSelect();
    menuTitles.refresh();
  }

  void dismissMenuWidget() {
    ///UI动画不需要动
    animatedHeight.value = -menuHeight;
    Future.delayed(const Duration(milliseconds: 300)).then((value) => isShowMenu.value = false);
    if (menuSelectCurrentIndex.value == 0) {
      aircraftMenuDismiss();
    } else if (menuSelectCurrentIndex.value == 1) {
      parameterMenuDismiss();
    }

    cleanHorMenu();
    menuTitles.refresh();
  }

  /// 清洗horMenu的数据
  void cleanHorMenu() {
    for (var element in menuTitles) {
      element.isSelect = false;
    }
  }

  /// /// 当menulist出现时需要将选择条选中的文字颜色改变
  void changeMenuSelect() {
    var item = menuTitles.removeAt(menuSelectCurrentIndex.value);
    item.isSelect = true;
    menuTitles.insert(menuSelectCurrentIndex.value, item);
  }

  /// 飞行器
  void _readAircraftJson() async {
    var jsStr = await R.text.aircraft_json();
    var jsOb = json.decode(jsStr);
    rankLeftListModels.value = AircraftModel.fromJson(jsOb).item;
    rankLeftListModels.removeAt(0);
  }

  /// 参数
  void _readParameterJson() async {
    var jsStr = await R.text.parameter_json();
    var jsOb = json.decode(jsStr);
    rankRightListModels.value = AircraftModel.fromJson(jsOb).item;
    rankRightListModels.removeAt(0);
  }

}

/// 飞行器的内容
extension AircraftMenuShow on RankLevelListController {
  void aircraftMenuShow(int index) {
    menuSelectCurrentIndex.value = index;
    cleanAircraftModel();
    updateAircraft();
  }

  void aircraftMenuDismiss() {
    changeAircraftMenuTitle();
  }

  /// 当点击右边listview的时候需要更新hormenu的文字
  void changeAircraftMenuTitle() {
    menuTitles[menuSelectCurrentIndex.value].title = rankLeftListModels[rankLeftCurrentIndex].title;
  }

  /// 更新飞行器的数据
  void updateAircraft() {
    rankLeftListModels[rankLeftCurrentIndex].isSelect = true;
  }

  /// 清洗数据
  void cleanAircraftModel() {
    for (var element in rankLeftListModels) {
      if (element.isSelect) {
        element.isSelect = false;
      }
    }
  }
}


/// 参数
extension ParameterMenuShow on RankLevelListController {
  void parameterMenuShow(int index) {
    menuSelectCurrentIndex.value = index;
    cleanParameterModel();
    updateParameter();
  }

  void parameterMenuDismiss() {
    changeParameterMenuTitle();
  }

  /// 当点击右边listview的时候需要更新hormenu的文字
  void changeParameterMenuTitle() {
    menuTitles[menuSelectCurrentIndex.value].title = rankRightListModels[rankRightCurrentIndex].title;
  }

  /// 更新飞行器的数据
  void updateParameter() {
    rankRightListModels[rankRightCurrentIndex].isSelect = true;
  }

  /// 清洗数据
  void cleanParameterModel() {
    for (var element in rankRightListModels) {
      if (element.isSelect) {
        element.isSelect = false;
      }
    }
  }
}

class RankListItemModel {
  RankListItemModel({this.title,this.img,this.parameter,this.tag});
  String? title;
  String? img;
  String? parameter;
  String? tag;
}