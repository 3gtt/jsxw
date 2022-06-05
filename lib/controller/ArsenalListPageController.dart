import 'dart:convert';
import 'package:com_3gtt_jsxw/model/arsenal_menu_model.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:com_3gtt_jsxw/model/aircraft_model.dart';

class ArsenalListPageController extends GetxController {
  // 初始值为1000 不让选中的状态
  static const noSelectedCount = 1000;
  final currentHorSelectorModel = HorSelectorModel(currentIndex: noSelectedCount, selectIndex: noSelectedCount).obs;
  final horLeftListSelectModel = HorSelectorModel(currentIndex: noSelectedCount, selectIndex: noSelectedCount).obs;
  final horRightListSelectModel = HorSelectorModel(currentIndex: noSelectedCount, selectIndex: noSelectedCount).obs;
  var isShowMenu = false.obs;
  static double menuHeight = Get.size.height / 5 * 2;
  var animatedHeight = (-menuHeight).obs;
  var arsenalModels = <ArsenalGridModel>[].obs;

  /// menuList
  var menuTitles = ["全部国家", "全部舰船舰艇", "全部时间"].obs;
  var arsenalLeftMenuModels = <Other_country>[];
  var arsenalRightMenuModels = [].obs;
  var leftCurrent = noSelectedCount.obs;
  var rightCurrent = noSelectedCount.obs;

  ///飞行器
  var aircraftModels = [].obs;



  void selectLeftGetRightMenuModel(int index) {
    arsenalRightMenuModels.removeRange(0, arsenalRightMenuModels.length);
    arsenalRightMenuModels.insertAll(0, arsenalLeftMenuModels[index].item ?? []);
  }

  void showMenuWidget(int index) {
    currentHorSelectorModel.value = HorSelectorModel(currentIndex: index, selectIndex: index);
    isShowMenu.value = true;
    Future.delayed(const Duration(milliseconds: 100)).then((value) => animatedHeight.value = 0);
  }

  void dismissMenuWidget() {
    animatedHeight.value = -menuHeight;
    currentHorSelectorModel.value.currentIndex = noSelectedCount;
    Future.delayed(const Duration(milliseconds: 300)).then((value) => isShowMenu.value = false);
  }

  @override
  void onInit() {
    super.onInit();
    createData();
    _readTestJson();
  }

  /// GridView的数据
  void createData() {
    removeData();
    arsenalModels.insertAll(0, getListModels());
    update();
  }

  void removeData() {
    if (arsenalModels.isNotEmpty) {
      arsenalModels.removeRange(0, arsenalModels.length);
    }
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
    arsenalLeftMenuModels = ArsenalMenuModel.fromJson(jsOb).otherCountry;
  }

  /// 飞行器
  void _readAircraftjson() async{
    var jsStr = await R.text.aircraft_json();
    var jsOb = json.decode(jsStr);
    aircraftModels.value = AircraftModel.fromJson(jsOb).item;
  }
}

class HorSelectorModel {
  HorSelectorModel({required this.currentIndex, required this.selectIndex});

  var currentIndex = ArsenalListPageController.noSelectedCount;
  var selectIndex = ArsenalListPageController.noSelectedCount;
}

class ArsenalGridModel {
  const ArsenalGridModel({required this.title, required this.subTitle, required this.des, required this.img});

  final String title;
  final String subTitle;
  final String des;
  final int img;
}
