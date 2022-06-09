import 'dart:convert';
import 'package:com_3gtt_jsxw/model/arsenal_menu_model.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:com_3gtt_jsxw/model/aircraft_model.dart';
import 'package:com_3gtt_jsxw/model/aircraft_time_model.dart';

import '../model/custom/hor_selector_model.dart';

class ArsenalListPageController extends GetxController {
  // 初始值为1000 不让选中的状态
  static const noSelectedCount = 0;

  /// menu的动画
  var isShowMenu = false.obs;
  static double menuHeight = Get.size.height / 5 * 2;
  var animatedHeight = (-menuHeight).obs;

  /// GridView的内容
  var arsenalModels = <ArsenalGridModel>[].obs;

  /// menuList
  var menuTitles = <HorSelectorModel>[].obs;
  var menuSelectCurrentIndex = noSelectedCount.obs;

  ///全部武器
  var arsenalLeftMenuModels = <Other_country>[].obs;
  var arsenalLeftCurrentIndex = noSelectedCount;

  var arsenalRightMenuModels = [].obs;
  var arsenalRightCurrentIndex = noSelectedCount;

  ///飞行器
  var aircraftModels = [].obs;
  var aircraftCurrentIndex = noSelectedCount;

  /// 时间
  var timeModels = [].obs;
  var timeCurrentIndex = noSelectedCount;

  @override
  void onInit() {
    super.onInit();
    createData();
    _readTestJson();
    _readAircraftJson();
    _readTimeJson();
    menuTitles.insertAll(0, [HorSelectorModel(title: "全部国家"), HorSelectorModel(title: "全部飞行器"), HorSelectorModel(title: "全部时间")]);
  }

  void showMenuWidget(int index) {
    /// 下面是动画不需要动
    isShowMenu.value = true;
    Future.delayed(const Duration(milliseconds: 100)).then((value) => animatedHeight.value = 0);
    if (index == 0) {
      allCountriesShow(index);
    } else if (index == 1) {
      aircraftMenuShow(index);
    } else {
      timeMenuShow(index);
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
      allCountriesDismiss();
    } else if (menuSelectCurrentIndex.value == 1) {
      aircraftMenuDismiss();
    } else {
     timeMenuDismiss();
    }
    cleanHorMenu();
    menuTitles.refresh();
  }

  /// GridView的数据
  void createData() {
    removeData();
    arsenalModels.insertAll(0, getListModels());
  }

  /// 删除GridView的数据
  void removeData() {
    if (arsenalModels.isNotEmpty) {
      arsenalModels.removeRange(0, arsenalModels.length);
    }
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

  List<ArsenalGridModel> getListModels() {
    return [
      const ArsenalGridModel(title: "轰6(图-16)\"獾\"", subTitle: "轰炸机｜二战后至冷战期间", des: "目前是中国人民解放军空军战略轰炸力量的核心机种之一。", img: 1),
      const ArsenalGridModel(title: "运20", subTitle: "运输机｜冷战后至今", des: "中国迄今为止研制的投送能力最强的军用运输机。", img: 2),
      const ArsenalGridModel(title: "图-154M电子战飞机", subTitle: "电子战机｜冷战后至今", des: "中国最精锐的大型电子战飞机。", img: 3),
      const ArsenalGridModel(title: "905型\"太仓级补给船\"", subTitle: "保障辅助舰艇｜ 冷战后至今", des: "为我国第一艘油水干货补给船。", img: 4),
      const ArsenalGridModel(title: "052D型（旅洋III级）", subTitle: "驱逐舰｜冷战后至今", des: "052D被称为\"中华神盾\"当之无愧。", img: 5),
      const ArsenalGridModel(title: "052C型（旅洋Ⅱ级）", subTitle: "驱逐舰｜冷战后至今", des: "中国海军第一次游泳远程区域防空能力。", img: 6),
      const ArsenalGridModel(title: "歼-20", subTitle: "战斗机｜冷战后至今", des: "世界上第二架应用EODAS的战斗机。", img: 7),
      const ArsenalGridModel(title: "歼-31战斗机", subTitle: "战斗机｜冷战后至今", des: "歼-31是沈阳飞机工业集团研制的最新一代双发中型隐形战斗机。", img: 8),
    ];
  }

  /// 上拉加载更多的GridView的数据
  void mock([var onChanged]) {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      arsenalModels.insertAll(arsenalModels.length, getListModels());
      update();
      if (onChanged != null) {
        onChanged();
      }
    });
  }

  /// menuList的数据
  void _readTestJson() async {
    var jsStr = await R.text.arsenalmenu_json();
    var jsOb = json.decode(jsStr);
    arsenalLeftMenuModels.value = ArsenalMenuModel.fromJson(jsOb).otherCountry;
  }

  /// 飞行器
  void _readAircraftJson() async {
    var jsStr = await R.text.aircraft_json();
    var jsOb = json.decode(jsStr);
    aircraftModels.value = AircraftModel.fromJson(jsOb).item;
  }

  /// 时间
  void _readTimeJson() async {
    var jsStr = await R.text.arsenalTime_json();
    var jsOb = json.decode(jsStr);
    timeModels.value = getAircraftTimeModelList(jsOb);
  }
}

/// 全部国家选项
extension AllCountries on ArsenalListPageController {
  /// 全部国家菜单弹出后的动作
  void allCountriesShow(int index) {
    /// 2个ListView的更新
    arsenalTwoListUpdate();

    /// 这个是让你知道横向menu的选中索引
    menuSelectCurrentIndex.value = index;
  }

  void allCountriesDismiss() {
    /// 在退出menu的时候一定要清洗数据
    cleanLeftListView();
    cleanRightListView();
    changeMenuTitle();
  }

  /// 当点击右边listview的时候需要更新hormenu的文字
  void changeMenuTitle() {
    var leftItem = arsenalLeftMenuModels[arsenalLeftCurrentIndex].item?[arsenalRightCurrentIndex];
    if (leftItem != null) {
      var item = menuTitles.removeAt(menuSelectCurrentIndex.value);
      item.title = leftItem.title;
      menuTitles.insert(menuSelectCurrentIndex.value, item);
    } else {
      menuTitles[menuSelectCurrentIndex.value].title = arsenalLeftMenuModels[arsenalLeftCurrentIndex].title;
    }
  }

  /// 全部武器 点击左边ListView 更新右边ListView的数据
  void selectLeftGetRightMenuModel(int index) {
    arsenalRightMenuModels.removeRange(0, arsenalRightMenuModels.length);
    arsenalRightMenuModels.insertAll(0, arsenalLeftMenuModels[index].item ?? []);
  }

  /// 2个ListView的更新
  void arsenalTwoListUpdate() {
    ///当menuList将要弹出时需要将缓存的选中索引放入到现有的左listview中
    arsenalLeftMenuModels[arsenalLeftCurrentIndex].isSelect = true;

    /// 右边的menuList需要更新
    arsenalRightMenuModels.removeRange(0, arsenalRightMenuModels.length);
    arsenalRightMenuModels.insertAll(0, arsenalLeftMenuModels[arsenalLeftCurrentIndex].item ?? []);

    ///当menuList将要弹出时需要将缓存的选中索引放入到现有的右listview中
    if (arsenalRightMenuModels.isNotEmpty) {
      arsenalRightMenuModels[arsenalRightCurrentIndex].isSelect = true;
    }
  }

  /// 清洗左listview数据
  void cleanLeftListView() {
    for (var element in arsenalLeftMenuModels) {
      if (element.isSelect) {
        element.isSelect = false;
      }
    }
  }

  /// 清洗右listview数据
  void cleanRightListView() {
    for (var element in arsenalRightMenuModels) {
      if (element.isSelect) {
        element.isSelect = false;
      }
    }
  }
}

/// 飞行器的内容
extension AircraftMenuShow on ArsenalListPageController {
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
    menuTitles[menuSelectCurrentIndex.value].title = aircraftModels[aircraftCurrentIndex].title;
  }

  /// 更新飞行器的数据
  void updateAircraft() {
    aircraftModels[aircraftCurrentIndex].isSelect = true;
  }

  /// 清洗数据
  void cleanAircraftModel() {
    for (var element in aircraftModels) {
      if (element.isSelect) {
        element.isSelect = false;
      }
    }
  }
}

extension TimeMenuShow on ArsenalListPageController {

  void timeMenuShow(int index) {
    menuSelectCurrentIndex.value = index;
    cleanTimeModel();
    updateTimeModel();

  }
  void timeMenuDismiss() {
    changeTimeMenuTitle();
  }

  void cleanTimeModel(){
    for (var element in timeModels){
      if (element.isSelect){
        element.isSelect = false;
      }
    }

  }
  void updateTimeModel(){
    timeModels[timeCurrentIndex].isSelect = true;
  }

  /// 当点击右边listview的时候需要更新hormenu的文字
  void changeTimeMenuTitle() {
    menuTitles[menuSelectCurrentIndex.value].title = timeModels[timeCurrentIndex].title;
  }

}

class ArsenalGridModel {
  const ArsenalGridModel({required this.title, required this.subTitle, required this.des, required this.img});

  final String title;
  final String subTitle;
  final String des;
  final int img;
}
