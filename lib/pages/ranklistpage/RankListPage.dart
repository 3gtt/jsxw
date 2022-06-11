import 'package:com_3gtt_jsxw/common/RouteManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/RankListController.dart';
import 'package:com_3gtt_jsxw/r.g.dart';

class RankListPage extends StatelessWidget {
  const RankListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("排行榜"),
      ),
      child: GetBuilder(init: RankListController(), builder: (context) => const RankListWidget()),
    );
  }
}

class RankListWidget extends StatelessWidget {
  const RankListWidget({Key? key}) : super(key: key);

  void _handleTap(String title) {
      RouteManager.jumpRankLevelListPage(title);
  }

  @override
  Widget build(BuildContext context) {
    RankListController c = Get.find<RankListController>();
    return Obx(() => ListView.separated(
        itemCount: c.rankListModels.length,
        itemBuilder: (context, index) {
          return Material(
            child: ListTile(
              onTap: () {
                _handleTap(c.rankListModels[index].cfControllerParam.title);
              },
              leading: Image(image: AssetImage("packages/com_3gtt_jsxw/assets/images/arsenal/icon_10${index + 1}.png")),
              title: Text(c.rankListModels[index].cfTitle, style: TextStyle(color: Colors.grey[600]),),
              trailing: const Icon(Icons.arrow_right),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) =>  Divider(indent: 70,height: 1.0, color: Colors.grey[400])
    ));
  }
}
