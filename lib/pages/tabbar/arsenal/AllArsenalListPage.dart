import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/ArsenalListPageController.dart';
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/ArsenalListPage.dart';

class AllArsenalListPage extends StatelessWidget {
  const AllArsenalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.systemBackground,
      child: GetBuilder(
          init: ArsenalListPageController(),
          builder: (context) => ArsenalGridWidget()
      ),
    );
  }
}
