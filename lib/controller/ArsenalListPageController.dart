import 'package:get/get.dart';

class ArsenalListPageController extends GetxController{
  final horSelectorModel = HorSelectorModel(currentIndex: 10).obs;
}

class HorSelectorModel {
  HorSelectorModel({required this.currentIndex});
  final int currentIndex;
}