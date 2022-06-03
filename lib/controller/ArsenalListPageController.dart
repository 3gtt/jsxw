import 'package:get/get.dart';

class ArsenalListPageController extends GetxController{
  final horSelectorModel = HorSelectorModel(currentIndex: 10).obs;
  final arsenalModels = <ArsenalGridModel>[].obs;

  void mock() {
    Future.delayed(const Duration(seconds: 2)).then((value) => arsenalModels.insertAll(arsenalModels.length - 1, arsenalModels));
  }
  @override
  void onInit() {
    super.onInit();
    arsenalModels.insertAll(0, [
      ArsenalGridModel(title: "轰6(图-16)\"獾\"", subTitle: "轰炸机｜二战后至冷战期间",des: "目前是中国人民解放军空军战略轰炸力量的核心机种之一。"),
      ArsenalGridModel(title: "运20", subTitle: "运输机｜冷战后至今",des: "中国迄今为止研制的投送能力最强的军用运输机。"),
      ArsenalGridModel(title: "图-154M电子战飞机", subTitle: "电子战机｜冷战后至今", des: "中国最精锐的大型电子战飞机。"),
      ArsenalGridModel(title: "905型\"太仓级补给船\"", subTitle: "保障辅助舰艇｜ 冷战后至今", des: "为我国第一艘油水干货补给船。"),
      ArsenalGridModel(title: "052D型（旅洋III级）", subTitle: "驱逐舰｜冷战后至今", des: "052D被称为\"中华神盾\"当之无愧。"),
      ArsenalGridModel(title: "052C型（旅洋Ⅱ级）", subTitle: "驱逐舰｜冷战后至今", des: "中国海军第一次游泳远程区域防空能力。"),
      ArsenalGridModel(title: "歼-20", subTitle: "战斗机｜冷战后至今", des: "世界上第二架应用EODAS的战斗机"),
      ArsenalGridModel(title: "歼-31战斗机", subTitle: "战斗机｜冷战后至今", des: "歼-31是沈阳飞机工业集团研制的最新一代双发中型隐形战斗机。"),
    ]);
  }

}

class HorSelectorModel {
  HorSelectorModel({required this.currentIndex});
  final int currentIndex;
}

class ArsenalGridModel {
  const ArsenalGridModel({ required this.title, required this.subTitle, required this.des});
  final String title;
  final String subTitle;
  final String des;
}