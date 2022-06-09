import 'package:com_3gtt_jsxw/common/RouteManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/RankLevelListController.dart';
import '../../model/custom/hor_selector_model.dart';

class RankLevelListPage extends StatelessWidget {
  const RankLevelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "排行榜",
        middle: Text(Get.arguments ?? ""),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      backgroundColor: CupertinoColors.systemBackground,
      child: GetBuilder(init: RankLevelListController(), builder: (context) => SafeArea(child: RankLevelListWidget())),
    );
  }
}

// ignore: must_be_immutable
class RankLevelListWidget extends StatelessWidget {
  RankLevelListWidget({Key? key}) : super(key: key);
  RankLevelListController c = Get.find<RankLevelListController>();

  void _handleMenuListTap() {
    c.dismissMenuWidget();
  }

  Widget _getMenuList(int index) {
    if (index == 0) {
      return RankLeftMenuList();
    }
    return RankRightMenuList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: invalid_use_of_protected_member
        Obx(() => HorSelector(listTitle: c.menuTitles.value)),
        Expanded(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                color: CupertinoColors.systemBackground,
                child: const RankListWidget(),
              ),
              Obx(() => Visibility(
                    visible: c.isShowMenu.value,
                    child: Opacity(
                      opacity: 0.5,
                      child: GestureDetector(
                        onTap: _handleMenuListTap,
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          color: Colors.black,
                          child: const Text(""),
                        ),
                      ),
                    ),
                  )),
              Obx(() => Visibility(
                    visible: c.isShowMenu.value,
                    child: AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      top: c.animatedHeight.value,
                      child: Container(
                        height: RankLevelListController.menuHeight,
                        width: Get.width,
                        color: Colors.white,
                        child: Obx(() => _getMenuList(c.menuSelectCurrentIndex.value)),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class RankListWidget extends StatelessWidget {
  const RankListWidget({Key? key}) : super(key: key);

  void _handleTap() {
    RouteManager.jumpArsenalDesPage();
  }

  @override
  Widget build(BuildContext context) {
    RankLevelListController c = Get.find<RankLevelListController>();
    return ListView.separated(
      itemCount: c.listModels.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const RankLevelHeader();
        }
        return Material(
          child: ListTile(
            leading: Image(image: AssetImage("packages/com_3gtt_jsxw/assets/images/country/${c.listModels[index].img}.png")),
            title: Padding(padding: EdgeInsets.zero, child: Text("$index  ${c.listModels[index].title ?? ""}")),
            trailing: Text(
              c.listModels[index].parameter ?? "",
              style: TextStyle(color: Colors.grey[500]),
            ),
            onTap: _handleTap,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Divider(indent: 15, height: 1.0, color: Colors.grey[400]);
        }
        return Divider(indent: 70, height: 1.0, color: Colors.grey[400]);
      },
    );
  }
}

class RankLevelHeader extends StatelessWidget {
  const RankLevelHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RankLevelListController c = Get.find<RankLevelListController>();
    return Container(
      color: Colors.grey[50],
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 15, top: 10, bottom: 10), child: Text("国别")),
          const Padding(padding: EdgeInsets.only(left: 20, top: 10, bottom: 10), child: Text("名称")),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Obx(() => Text(
                    "${c.menuTitles[1].title ?? ""}(米)",
                    style: TextStyle(color: Colors.grey[500]),
                  ))),
        ],
      ),
    );
  }
}

/// 参数
// ignore: must_be_immutable
class RankRightMenuList extends StatelessWidget {
  RankRightMenuList({Key? key}) : super(key: key);
  RankLevelListController c = Get.find<RankLevelListController>();

  void _handleTap(int index) {
    c.rankRightCurrentIndex = index;
    c.dismissMenuWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: c.rankRightListModels.length,
                    itemBuilder: (context, index) {
                      return Material(
                          child: ListTile(
                        selected: c.rankRightListModels[index].isSelect,
                        selectedColor: Colors.black,
                        selectedTileColor: Colors.white,
                        title: Text(
                          c.rankRightListModels[index].title,
                          style: TextStyle(color: c.rankRightListModels[index].isSelect ? Colors.red[400] : Colors.black),
                        ),
                        onTap: () => _handleTap(index),
                      ));
                    })),
          ],
        ));
  }
}

/// 飞行器
// ignore: must_be_immutable
class RankLeftMenuList extends StatelessWidget {
  RankLeftMenuList({Key? key}) : super(key: key);
  RankLevelListController c = Get.find<RankLevelListController>();

  void _handleTap(int index) {
    c.rankLeftCurrentIndex = index;
    c.dismissMenuWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: c.rankLeftListModels.length,
                    itemBuilder: (context, index) {
                      return Material(
                          child: ListTile(
                        selected: c.rankLeftListModels[index].isSelect,
                        selectedColor: Colors.black,
                        selectedTileColor: Colors.white,
                        title: Text(
                          c.rankLeftListModels[index].title,
                          style: TextStyle(color: c.rankLeftListModels[index].isSelect ? Colors.red[400] : Colors.black),
                        ),
                        onTap: () => _handleTap(index),
                      ));
                    })),
          ],
        ));
  }
}

/// horSelectorMenu
class HorSelector extends StatelessWidget {
  const HorSelector({Key? key, this.height = 40, required this.listTitle}) : super(key: key);
  final double height;
  final List<HorSelectorModel> listTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.5),
            child: CustomPaint(
              painter: HorLinePainter(count: listTitle.length),
              size: Size(MediaQuery.of(context).size.width, height),
            ),
          ),
          Flex(direction: Axis.horizontal, children: [
            for (int i = 0; i < listTitle.length; i++)
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1, left: 0.5, right: 0.5),
                    child: SelectWidget(
                      title: listTitle[i].title ?? "",
                      index: i,
                    ),
                  ))
          ])
        ],
      ),
    );
  }
}

class SelectWidget extends StatelessWidget {
  SelectWidget({Key? key, required this.title, required this.index}) : super(key: key);
  final String title;
  final int index;
  final c = Get.find<RankLevelListController>();

  void _handleOnTap() {
    c.showMenuWidget(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: Obx(
        () => Container(color: Colors.grey[50], child: Center(child: Text(title, style: TextStyle(fontSize: 15, color: c.menuTitles[index].isSelect ? Colors.red[400] : Colors.black)))),
      ),
    );
  }
}

class HorLinePainter extends CustomPainter {
  const HorLinePainter({required this.count}) : super();
  final int count;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    drawHorLine(canvas, rect);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void drawHorLine(Canvas canvas, Rect rect) {
    var paint = Paint();
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.fill; //填充
    paint.color = Colors.white;
    canvas.drawRect(rect, paint);

    // line
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.grey[400] ?? Colors.grey;
    paint.strokeWidth = 0.5;
    canvas.drawLine(Offset(rect.left, rect.top), Offset(rect.right, rect.top), paint);
    canvas.drawLine(Offset(rect.left, rect.bottom), Offset(rect.right, rect.bottom), paint);

    for (int i = 1; i <= count; i++) {
      if (i == count) {
        continue;
      }
      final double dx = (rect.size.width / count) * i - 0.25;
      final double dy1 = (rect.size.height) / 4;
      final double dy2 = (rect.size.height) / 4 * 3;
      canvas.drawLine(Offset(dx, dy1), Offset(dx, dy2), paint);
    }
  }
}
