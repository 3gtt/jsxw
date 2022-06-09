import 'dart:convert';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/model/rank_list_model.dart';
import '../r.g.dart';
class RankListController extends GetxController {
  final rankListModels = <Cf_items>[].obs;

  @override
  void onInit() {
    super.onInit();
    _readRankListJson();
  }
  /// menuList的数据
  void _readRankListJson() async {
    var jsStr = await R.text.ranklist_json();
    var jsOb = json.decode(jsStr);
    rankListModels.value = RankListModel.fromJson(jsOb).cfItems;

  }

}