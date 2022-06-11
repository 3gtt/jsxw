import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/NewListDesController.dart';

class NewListDesPage extends StatelessWidget {
  const NewListDesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: "军情在线",
        ),
        backgroundColor: CupertinoColors.systemBackground,
        child: SafeArea(
          child: Material(
            child: GetBuilder(init: NewListDesController(), builder: (context) => Container()),
          ),
        )
    );
  }
}
