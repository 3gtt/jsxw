import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:flutter/material.dart';
import 'package:com_3gtt_jsxw/model/arsenal_model.dart';
import 'package:com_3gtt_jsxw/widgets/HeaderGridView.dart';
import 'package:com_3gtt_jsxw/widgets/HorizontalFullImageWidget.dart';
import 'package:get/get.dart';

class ArsenalTabPage extends StatefulWidget {
  const ArsenalTabPage({Key? key}) : super(key: key);

  @override
  State<ArsenalTabPage> createState() => _ArsenalTabPageState();
}

class _ArsenalTabPageState extends State<ArsenalTabPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: SafeArea(child: ArsenalWidget()));
  }
}

class ArsenalWidget extends StatefulWidget {
  const ArsenalWidget({Key? key}) : super(key: key);

  @override
  State<ArsenalWidget> createState() => _ArsenalWidgetState();
}

class _ArsenalWidgetState extends State<ArsenalWidget> {
  List<ArsenalModel> listModel = <ArsenalModel>[];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _readTestJson();
  }

  void _readTestJson() async {
    var jsStr = await R.text.weapons_home_json();
    var jsOb = json.decode(jsStr);
    setState(() {
      listModel = getArsenalModelList(jsOb);
    });
  }

  void _handleItemTap(int index) {
      Get.toNamed("/ArsenalListPage");
  }
  void _handleHeaderTap() {
      Get.toNamed("/AllArsenalListPage");
  }


  @override
  Widget build(BuildContext context) {
    return HeadGridView(
      headers: [
        GestureDetector(
          onTap: () => _handleHeaderTap(),
          child: const ArsenalHeader()
        ),
      ],
      padding: const EdgeInsets.all(5),
      itemCount: listModel.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return  GestureDetector(
          onTap: () => _handleItemTap(index),
          child: ArsenalGridItem(index: index + 1, model: listModel[index])
        );
      },
    );
  }
}

class ArsenalGridItem extends StatefulWidget {
  const ArsenalGridItem({Key? key, required this.index, required this.model}) : super(key: key);
  final int index;
  final ArsenalModel model;

  @override
  State<ArsenalGridItem> createState() => _ArsenalGridItemState();
}

class _ArsenalGridItemState extends State<ArsenalGridItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          ClipRRect(
          //剪裁为圆角矩形
          borderRadius: BorderRadius.circular(5.0),
            child: HorizontalFullImageWidget(
                index: widget.index,
                title: widget.model.title
            ),
          )
        ],
      );
  }
}

class ArsenalHeader extends StatelessWidget {
  const ArsenalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        children: [
          ClipRRect(
              //剪裁为圆角矩形
              borderRadius: BorderRadius.circular(5.0),
              child: Image(fit: BoxFit.fill, image: R.image.icon_all())),
          const Center(
              child: Text("全部武器",
                  style: TextStyle(color: Colors.white, fontSize: 32)))
        ],
      ),
    );
  }
}