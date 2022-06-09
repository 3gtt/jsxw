import 'package:com_3gtt_jsxw/common/GlobalVariable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/MoreController.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(color: Colors.red);
          }),
    );
  }
}
