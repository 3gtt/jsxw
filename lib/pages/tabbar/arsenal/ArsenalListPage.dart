import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/ArsenalListPageController.dart';

class ArsenalListPage extends StatelessWidget {
  const ArsenalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.systemBackground,
      child: GetBuilder(
          init: ArsenalListPageController(),
          builder: (context) => const GridListDemo()
      ),
    );
  }
}
class GridListDemo extends StatelessWidget {
  const GridListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: const [
            HorSelector(listTitle: ["全部国家", "全部舰船舰艇", "全部时间"]),
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
              Expanded(flex: 1, child: SelectWidget(title: listTitle[i], index: i))
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
    c.horSelectorModel.value = HorSelectorModel(
        currentIndex: index
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: Center(
          child: Obx(() {
            return Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  color: c.horSelectorModel.value.currentIndex == index ? Colors.red[400] : Colors.black
              )
            );
          })
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
