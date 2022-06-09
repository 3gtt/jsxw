
import '../../controller/ArsenalListPageController.dart';

/// 横向选择器的模型
class HorSelectorModel {
  HorSelectorModel({this.title});

  var currentIndex = ArsenalListPageController.noSelectedCount;
  bool isSelect = false;
  String? title;
}