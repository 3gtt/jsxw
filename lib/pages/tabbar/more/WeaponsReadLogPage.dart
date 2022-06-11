import 'package:com_3gtt_jsxw/common/RouteManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/WeaponsReadLogController.dart';

// ignore: must_be_immutable
class WeaponsReadLogPage extends StatelessWidget {
  WeaponsReadLogPage({Key? key}) : super(key: key);

  void _handleTap() {
    WeaponsReadLogController c = Get.find<WeaponsReadLogController>();
    c.isSelect.value = !c.isSelect.value;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: WeaponsReadLogController(),
        builder: (context) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text((Get.arguments ?? "")),
                trailing: TextButton(
                  onPressed: _handleTap,
                  child: Obx(() => Get.find<WeaponsReadLogController>().isSelect.value ? const Text("阅读时间") : const Text("阅读次数")),
                ),
              ),
              child: const SafeArea(
                child: ReadLogWidget(),
              ),
            ));
  }
}

class ReadLogWidget extends StatelessWidget {
  const ReadLogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: const ReadLogItem(),
            onTap: () {
              RouteManager.jumpArsenalDesPage();
            },
          ) ;
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider(indent: 15, color: Colors.grey[400]);

    },);
  }
}

class ReadLogItem extends StatelessWidget {
  const ReadLogItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(
            left: 15,top: 10,bottom: 10
          ),
          child: Text("运-20"),
        ),
        Spacer(),
        Padding(padding: EdgeInsets.only(right: 10), child: Text("11次", style: TextStyle(color: Colors.grey),)),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child:  Image(width: 10, image: AssetImage("packages/com_3gtt_jsxw/assets/images/lcweb_forword.png"), color: Colors.grey),
        ),
      ],
    );
  }
}
