import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class ArsenalListPageController extends GetxController{
  final horSelectorModel = HorSelectorModel(currentIndex: 10).obs;
  final arsenalModels = <ArsenalGridModel>[].obs;
  void mock(var onChanged) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      arsenalModels.insertAll(arsenalModels.length, getListModels());
      onChanged();
    });
  }
  @override
  void onInit() {
    super.onInit();
    createData();
  }

  List<ArsenalGridModel> getListModels() {
    return [ const ArsenalGridModel(title: "轰6(图-16)\"獾\"", subTitle: "轰炸机｜二战后至冷战期间",des: "目前是中国人民解放军空军战略轰炸力量的核心机种之一。",img: 1),
    const ArsenalGridModel(title: "运20", subTitle: "运输机｜冷战后至今",des: "中国迄今为止研制的投送能力最强的军用运输机。",img: 2),
    const ArsenalGridModel(title: "图-154M电子战飞机", subTitle: "电子战机｜冷战后至今", des: "中国最精锐的大型电子战飞机。",img: 3),
    const ArsenalGridModel(title: "905型\"太仓级补给船\"", subTitle: "保障辅助舰艇｜ 冷战后至今", des: "为我国第一艘油水干货补给船。",img: 4),
    const ArsenalGridModel(title: "052D型（旅洋III级）", subTitle: "驱逐舰｜冷战后至今", des: "052D被称为\"中华神盾\"当之无愧。",img: 5),
    const ArsenalGridModel(title: "052C型（旅洋Ⅱ级）", subTitle: "驱逐舰｜冷战后至今", des: "中国海军第一次游泳远程区域防空能力。",img: 6),
    const ArsenalGridModel(title: "歼-20", subTitle: "战斗机｜冷战后至今", des: "世界上第二架应用EODAS的战斗机。",img: 7),
    const ArsenalGridModel(title: "歼-31战斗机", subTitle: "战斗机｜冷战后至今", des: "歼-31是沈阳飞机工业集团研制的最新一代双发中型隐形战斗机。",img: 8),
    // ArsenalGridModel(title: loadingTag, subTitle: "", des: "", img: 1),
    ];
  }

  void createData() {
    if (arsenalModels.isNotEmpty) {
      arsenalModels.removeRange(0, arsenalModels.length - 1);
    }
    arsenalModels.insertAll(0, getListModels());
  }

}

class HorSelectorModel {
  HorSelectorModel({required this.currentIndex});
  final int currentIndex;
}

class ArsenalGridModel {
  const ArsenalGridModel({ required this.title, required this.subTitle, required this.des, required this.img});
  final String title;
  final String subTitle;
  final String des;
  final int img;
}