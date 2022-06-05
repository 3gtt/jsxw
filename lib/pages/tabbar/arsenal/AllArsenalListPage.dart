import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/ArsenalListPageController.dart';
import 'package:com_3gtt_jsxw/pages/tabbar/arsenal/ArsenalListPage.dart';
import 'package:com_3gtt_jsxw/widgets/LoadingMoreWidget.dart';

class AllArsenalListPage extends StatelessWidget {
  const AllArsenalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "武器库",
        middle: Text(Get.arguments ?? ""),
      ),
      backgroundColor: CupertinoColors.systemBackground,
      child: GetBuilder(
          init: ArsenalListPageController(),
          builder: (context) => const ArsenalContainer()
      ),
    );
  }
}



class ArsenalContainer extends StatefulWidget {
  const ArsenalContainer({Key? key}) : super(key: key);

  @override
  State<ArsenalContainer> createState() => _ArsenalContainerState();
}

class _ArsenalContainerState extends State<ArsenalContainer> {
  final _scrollController = ScrollController(initialScrollOffset: 0);
  var isEndLoading = true;
  var isEnd = true;
  ArsenalListPageController c = Get.find<ArsenalListPageController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (c.arsenalModels.length < 20) {
          isEndLoading = false;
        } else {
          isEnd = false;
        }
        setState(() {});
        if (isEnd) {
          c.mock(() {
            isEndLoading = true;
            setState(() {});
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.only(bottom: 20),
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: ArsenalGridWidget(sController: _scrollController),
            ),
            Offstage(
                offstage: isEndLoading,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.only(top: 0),
                  child: const LoadingMoreWidget(),
                )),
            Offstage(
                offstage: isEnd,
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 0),
                  child: const Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ))
          ],
        ));
  }
}