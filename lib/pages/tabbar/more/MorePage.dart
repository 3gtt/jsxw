import 'package:com_3gtt_jsxw/common/GlobalVariable.dart';
import 'package:com_3gtt_jsxw/common/RouteManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../controller/MoreController.dart';
import 'WeaponsReadLogPage.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: GetBuilder(init: MoreController(), builder: (context) => const ListViewWidget()),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  void _handle(int index) {
    if (index == 0){
      Get.showSnackbar(const GetSnackBar(message:"这个是腾讯的广告", duration: Duration(milliseconds: 2000),)) ;
    } else if (index == 1) {
      RouteManager.jumpAllArsenalListPage("武器收藏夹");
    } else if (index == 2) {
      RouteManager.jumpWeaponsReadLogPage("武器阅读记录");
    } else if (index == 3) {

    } else if (index == 4) {

    } else if (index == 5) {
      RouteManager.jumpFeedBackPage();
    } else if (index == 6) {
      Share.shareWithResult("https://pub.dev/packages/mobpush_plugin#-readme-tab-");
    }
  }

  @override
  Widget build(BuildContext context) {
    MoreController c = Get.find<MoreController>();
    return Container(
      color: Colors.grey[200],
      child: ListView.separated(
        itemCount: c.listModels.length,
        itemBuilder: (context, index) {
          if (index == c.listModels.length - 1) {
            return Container(
              height: 100,
              child: Center(
                child: Text(c.listModels[index].title ?? "", style: TextStyle(fontSize: 16, color: Colors.grey[600])),
              ),
            );
          }
          return Column(
            children: [
              Visibility(visible: !c.listModels[index].isGroup, child: Container(height: 40, color: Colors.transparent, child: const Text(""))),
              Material(
                  child: ListTile(
                onTap: () {
                  _handle(index);
                },
                dense: true,
                leading: Image(width: 30, height: 30, image: AssetImage("packages/com_3gtt_jsxw/assets/images/more/${c.listModels[index].icon}.png")),
                title: Text(
                  c.listModels[index].title ?? "",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                trailing: const Icon(Icons.arrow_right),
              )),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(indent: c.listModels[index].isGroup ? 0 : 70, height: 1.0, color: Colors.grey[400]);
        },
      ),
    );
  }
}
