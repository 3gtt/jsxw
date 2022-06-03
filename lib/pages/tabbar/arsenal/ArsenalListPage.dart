import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/ArsenalListPageController.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:com_3gtt_jsxw/widgets/HorizontalFullImageWidget.dart';
import 'package:com_3gtt_jsxw/widgets/LoadingMoreWidget.dart';

class ArsenalListPage extends StatelessWidget {
  const ArsenalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.systemBackground,
      child: GetBuilder(
          init: ArsenalListPageController(),
          builder: (context) => ArsenalContainer()),
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
        }else {
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
        minimum: EdgeInsets.only(bottom: 20),
        bottom: false,
        child: Column(
      children: [
        const HorSelector(listTitle: ["全部国家", "全部舰船舰艇", "全部时间"]),
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

class ArsenalGridWidget extends StatelessWidget {
  const ArsenalGridWidget({Key? key, this.sController}) : super(key: key);
  final ScrollController? sController;

  @override
  Widget build(BuildContext context) {
    ArsenalListPageController c = Get.find<ArsenalListPageController>();
    return GridView.builder(
      itemCount: c.arsenalModels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 0,
          childAspectRatio: 1),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(10),
            child: ArsenalListGridItem(index: index));
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
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
            child: Text(
              c.arsenalModels[index].subTitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              overflow: TextOverflow.ellipsis,
            )),
        Text(
          c.arsenalModels[index].des,
          maxLines: 2,
          style: const TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis,
        ),
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
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "packages/com_3gtt_jsxw/assets/images/arsenal/arsenal${c.arsenalModels[index].img}.jpeg")))),
            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.zero,
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                  child: Image(fit: BoxFit.cover, image: R.image.china_s())),
            ),
            const Opacity(
              opacity: 0.6,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.zero,
                      topLeft: Radius.zero,
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  child: HorizontalFullBgWidget(
                      alignment: Alignment.bottomCenter)),
            ),
            HorizontalFullTextWidget(
                title: c.arsenalModels[index].title,
                alignment: Alignment.bottomCenter)
          ],
        ));
  }
}

class HorSelector extends StatelessWidget {
  const HorSelector({Key? key, required this.listTitle, this.height = 40})
      : super(key: key);
  final double height;
  final List<String> listTitle;

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
                  flex: 1, child: SelectWidget(title: listTitle[i], index: i))
          ])
        ],
      ),
    );
  }
}

class SelectWidget extends StatelessWidget {
  SelectWidget({Key? key, required this.title, required this.index})
      : super(key: key);
  final String title;
  final int index;
  final c = Get.find<ArsenalListPageController>();

  void _handleOnTap() {
    c.horSelectorModel.value = HorSelectorModel(currentIndex: index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: Center(child: Obx(() {
        return Text(title,
            style: TextStyle(
                fontSize: 15,
                color: c.horSelectorModel.value.currentIndex == index
                    ? Colors.red[400]
                    : Colors.black));
      })),
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
    canvas.drawLine(
        Offset(rect.left, rect.top), Offset(rect.right, rect.top), paint);
    canvas.drawLine(
        Offset(rect.left, rect.bottom), Offset(rect.right, rect.bottom), paint);

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
