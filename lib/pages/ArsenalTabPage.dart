import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:flutter/material.dart';
import 'package:com_3gtt_jsxw/model/arsenal_model.dart';
import 'package:com_3gtt_jsxw/widgets/HeaderGridView.dart';

class ArsenalTabPage extends StatefulWidget {
  const ArsenalTabPage({Key? key}) : super(key: key);

  @override
  State<ArsenalTabPage> createState() => _ArsenalTabPageState();
}

class _ArsenalTabPageState extends State<ArsenalTabPage> {
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

  @override
  Widget build(BuildContext context) {
    debugPrint(R.image.icon_all().keyName);
    // packages/com_3gtt_jsxw/assets/images/arsenal/icon_all.png
    return HeadGridView(
      headers: const [ArsenalHeader()],
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return const Text('data');
      },
    );
  }
}

class ArsenaGrideItem extends StatefulWidget {
  const ArsenaGrideItem({Key? key}) : super(key: key);

  @override
  State<ArsenaGrideItem> createState() => _ArsenaGrideItemState();
}

class _ArsenaGrideItemState extends State<ArsenaGrideItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ArsenalHeader extends StatelessWidget {
  const ArsenalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
