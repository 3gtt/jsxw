import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';


class ArsenalDesController extends GetxController {
  final desTextListModels = <ArsenalDesTextItemModel>[].obs;
  final recommendedModels = <ArsenalDesRecommendedModel>[].obs;


  @override
  void onInit() {
    super.onInit();

    createData();
  }




  void createData() {
    desTextListModels.insertAll(0, [
      ArsenalDesTextItemModel(itemTitle: "简介", countries: "中国", des: "运-20（中国编号：Y-20，代号 [1]  ：鲲鹏，英文：Xian Y-20），是中国研究制造的新一代军用大型运输机，于2013年1月26日首飞成功"),
      ArsenalDesTextItemModel(
          itemTitle: "结构特点", countries: "", des: "运-20飞机研发参考俄罗斯伊尔-76的气动外形和结构设计，融合美国C-17的部分特点。运-20采用常规布局，悬臂式上单翼、前缘后掠、无翼梢小翼 [2]  ，拥有高延伸性、高可靠性和安全性。运-20作为大型多用途运输机，可在复杂气象条件下，执行各种物资和人员的长距离航空运输任务。"),
      ArsenalDesTextItemModel(itemTitle: "型号演变", countries: "", des: "运-20参考了俄罗斯伊尔-76的气动外形和机体结构，并融合了美国C-17的部分特点。拥有高延伸性、高可靠性和安全性。 该机研制突破了数百项关键技术，标志着中国跻身世界大飞机行列，“该机充分体现了时代技术，将是未来很长时间内中国大型运输机平台”。"),
      ArsenalDesTextItemModel(itemTitle: "主要用户", countries: "", des: "巴基斯坦"),
      ArsenalDesTextItemModel(itemTitle: "通用参数", countries: "", des: "运-20 翼展:50米 机长:47米 机高:15米 航程:大于7800千米(满载) 实用升限:13000米 动力装置:D-30KP-2涡扇发动机 前缘后掠角:24度 最大载重量:66吨 最大起飞重量:220吨"),
    ]);

    recommendedModels.insertAll(0, [
      const ArsenalDesRecommendedModel(title: "轰6(图-16)\"獾\"", subTitle: "轰炸机｜二战后至冷战期间", des: "目前是中国人民解放军空军战略轰炸力量的核心机种之一。", img: 1),
      const ArsenalDesRecommendedModel(title: "运20", subTitle: "运输机｜冷战后至今", des: "中国迄今为止研制的投送能力最强的军用运输机。", img: 2),
    ]);

  }



}

class ArsenalDesTextItemModel {
  ArsenalDesTextItemModel({this.itemTitle = "", this.countries = "", this.des = ""});

  final String itemTitle;
  final String countries;
  final String des;
}

class ArsenalDesRecommendedModel {
  const ArsenalDesRecommendedModel({required this.title, required this.subTitle, required this.des, required this.img});

  final String title;
  final String subTitle;
  final String des;
  final int img;
}
