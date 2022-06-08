import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/ArsenalListPageController.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:com_3gtt_jsxw/widgets/HorizontalFullImageWidget.dart';
import 'package:com_3gtt_jsxw/widgets/LoadingMoreWidget.dart';
import 'package:com_3gtt_jsxw/common/RouteManager.dart';

class ArsenalListPage extends StatelessWidget {
  const ArsenalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "武器库",
        middle: Text(Get.arguments ?? ""),
      ),
      backgroundColor: CupertinoColors.systemBackground,
      child: GetBuilder(init: ArsenalListPageController(), id: "111", builder: (context) => const ArsenalContainer()),
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
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
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

  void _handleMenuListTap() {
    c.dismissMenuWidget();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
  }

  Widget _getMenuList(int index) {
    if (index == 0) {
      return ArsenalMenuList();
    } else if (index == 1) {
      return ArsenalAircraftMenuList();
    }
    return ArsenalTimeMenuList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.only(bottom: 0),
        bottom: false,
        child: Column(
          children: [
            Obx(() => HorSelector(listTitle: c.menuTitles.value)),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ArsenalGridWidget(sController: _scrollController),
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
                            height: ArsenalListPageController.menuHeight,
                            width: Get.width,
                            color: Colors.white,
                            child: Obx(() => _getMenuList(c.menuSelectCurrentIndex.value)),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Offstage(
                offstage: isEndLoading,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: const LoadingMoreWidget(),
                )),
            Offstage(
                offstage: isEnd,
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ))
          ],
        ));
  }
}

class ArsenalGridWidget extends StatelessWidget {
  const ArsenalGridWidget({Key? key, this.sController}) : super(key: key);
  final ScrollController? sController;

  void _onTap() {
      RouteManager.jumpArsenalDesPage();
  }

  @override
  Widget build(BuildContext context) {
    ArsenalListPageController c = Get.find<ArsenalListPageController>();
    return GridView.builder(
      itemCount: c.arsenalModels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 0, childAspectRatio: 1.05),
      itemBuilder: (BuildContext context, int index) {
        return Padding
          (padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 0),
            child: GestureDetector(
              onTap: _onTap,
              child: ArsenalListGridItem(index: index),
            )
        );
      },
      controller: sController,
    );
  }
}

class ArsenalListGridItem extends StatelessWidget {
  const ArsenalListGridItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    ArsenalListPageController c = Get.find<ArsenalListPageController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ArsenalListHorWidget(index: index),
        Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
            child: Text(
              c.arsenalModels[index].subTitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              overflow: TextOverflow.ellipsis,
            )),
        Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(
            c.arsenalModels[index].des,
            maxLines: 2,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class ArsenalListHorWidget extends StatelessWidget {
  const ArsenalListHorWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    ArsenalListPageController c = Get.find<ArsenalListPageController>();

    return AspectRatio(
        aspectRatio: 640 / 420.0,
        child: Stack(
          children: [
            AspectRatio(
                aspectRatio: 640 / 420.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(fit: BoxFit.cover, image: AssetImage("packages/com_3gtt_jsxw/assets/images/arsenal/arsenal${c.arsenalModels[index].img}.jpeg")))),
            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.zero, bottomLeft: Radius.zero, bottomRight: Radius.zero),
                  child: Image(fit: BoxFit.cover, image: R.image.china_s())),
            ),
            const Opacity(
              opacity: 0.6,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.zero, topLeft: Radius.zero, bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                  child: HorizontalFullBgWidget(alignment: Alignment.bottomCenter)),
            ),
            HorizontalFullTextWidget(title: c.arsenalModels[index].title, alignment: Alignment.bottomCenter)
          ],
        ));
  }
}

/// MenuList
/// 时间
// ignore: must_be_immutable
class ArsenalTimeMenuList extends StatelessWidget {
  ArsenalTimeMenuList({Key? key}) : super(key: key);
  ArsenalListPageController c = Get.find<ArsenalListPageController>();

  void _handleRightTap(int index) {
    c.timeCurrentIndex = index;
    c.dismissMenuWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: c.timeModels.length,
                    itemBuilder: (context, index) {
                      return Material(
                          child: ListTile(
                        selected: c.timeModels[index].isSelect,
                        selectedColor: Colors.black,
                        selectedTileColor: Colors.white,
                        title: Text(
                          c.timeModels[index].title,
                          style: TextStyle(color: c.timeModels[index].isSelect ? Colors.red[400] : Colors.black),
                        ),
                        onTap: () => _handleRightTap(index),
                      ));
                    })),
          ],
        ));
  }
}

/// 飞行器
// ignore: must_be_immutable
class ArsenalAircraftMenuList extends StatelessWidget {
  ArsenalAircraftMenuList({Key? key}) : super(key: key);
  ArsenalListPageController c = Get.find<ArsenalListPageController>();

  void _handleTap(int index) {
    c.aircraftCurrentIndex = index;
    c.dismissMenuWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: c.aircraftModels.length,
                    itemBuilder: (context, index) {
                      return Material(
                          child: ListTile(
                        selected: c.aircraftModels[index].isSelect,
                        selectedColor: Colors.black,
                        selectedTileColor: Colors.white,
                        title: Text(
                          c.aircraftModels[index].title,
                          style: TextStyle(color: c.aircraftModels[index].isSelect ? Colors.red[400] : Colors.black),
                        ),
                        onTap: () => _handleTap(index),
                      ));
                    })),
          ],
        ));
  }
}

/// 全部武器
// ignore: must_be_immutable
class ArsenalMenuList extends StatelessWidget {
  ArsenalMenuList({Key? key}) : super(key: key);
  ArsenalListPageController c = Get.find<ArsenalListPageController>();

  void _handleLeftTap(int index) {
    /// 用户点击left 更新isSelect 并不代表用户就会选中哪一个， 当用户点击了右边listview才能确认用户选择,所以只需要更新left中的数据即可
    for (var element in c.arsenalLeftMenuModels) {
      if (element.isSelect) {
        element.isSelect = false;
      }
    }
    c.arsenalLeftMenuModels[index].isSelect = true;

    /// 更新右边数据之前需要清洗清洗数据
    if (c.arsenalLeftCurrentIndex != index) {
      c.cleanRightListView();
    }

    /// 更新右边listview数据
    c.selectLeftGetRightMenuModel(index);

    if (c.arsenalLeftCurrentIndex == index) {
      if (c.arsenalRightMenuModels.isNotEmpty) {
        c.arsenalRightMenuModels[c.arsenalRightCurrentIndex].isSelect = true;
      }
    }
  }

  void _handleRightTap(int index) {
    /// 将数据保存到内存中，方便下次点击时可以正常显示选中状态
    for (int i = 0; i < c.arsenalLeftMenuModels.length; i++) {
      if (c.arsenalLeftMenuModels[i].isSelect) {
        c.arsenalLeftCurrentIndex = i;
      }
    }
    c.arsenalRightCurrentIndex = index;
    // 退出menu
    c.dismissMenuWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Visibility(
                visible: true,
                child: Expanded(
                    flex: 1,
                    child: ListView.builder(
                        itemCount: c.arsenalLeftMenuModels.length,
                        itemBuilder: (context, index) {
                          return Material(
                              child: ListTile(
                            selected: c.arsenalLeftMenuModels[index].isSelect,
                            selectedColor: Colors.black,
                            selectedTileColor: Colors.white,
                            title: Text(
                              c.arsenalLeftMenuModels[index].title,
                              style: TextStyle(color: c.arsenalLeftMenuModels[index].isSelect ? Colors.red[400] : Colors.black),
                            ),
                            trailing: const Icon(Icons.arrow_right) ,
                            onTap: () => _handleLeftTap(index),
                          ));
                        }))),
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: c.arsenalRightMenuModels.length,
                    itemBuilder: (context, index) {
                      return Material(
                          child: ListTile(
                        selected: c.arsenalRightMenuModels[index].isSelect,
                        selectedColor: Colors.black,
                        selectedTileColor: Colors.white,
                        title: Text(
                          c.arsenalRightMenuModels[index].title,
                          style: TextStyle(color: c.arsenalRightMenuModels[index].isSelect ? Colors.red[400] : Colors.black),
                        ),
                        onTap: () => _handleRightTap(index),
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
              painter: const HorLinePainter(count: 3),
              size: Size(MediaQuery.of(context).size.width, height),
            ),
          ),
          Flex(direction: Axis.horizontal, children: [
            for (int i = 0; i < listTitle.length; i++)
              Expanded(
                  flex: 1,
                  child: SelectWidget(
                    title: listTitle[i].title ?? "",
                    index: i,
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
  final c = Get.find<ArsenalListPageController>();

  void _handleOnTap() {
    c.showMenuWidget(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: Obx(() => Center(child: Text(title, style: TextStyle(fontSize: 15, color: c.menuTitles[index].isSelect ? Colors.red[400] : Colors.black)))),
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
      final double dx = (rect.size.width / 3) * i - 0.25;
      final double dy1 = (rect.size.height) / 4;
      final double dy2 = (rect.size.height) / 4 * 3;
      canvas.drawLine(Offset(dx, dy1), Offset(dx, dy2), paint);
    }
  }
}
