import 'package:com_3gtt_jsxw/common/RouteManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/ArsenalDesController.dart';
import 'package:com_3gtt_jsxw/widgets/HorizontalFullImageWidget.dart';

class ArsenalDesPage extends StatelessWidget {
  const ArsenalDesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text("运-20"),
          previousPageTitle: "飞行器",
          trailing: SizedBox(
            width: 100,
            child: ArsenalDesPageTrailing(),
          )),
      child: GetBuilder(init: ArsenalDesController(), builder: (context) => const SafeArea(child: ArsenalDesWidget())),
    );
  }
}

class ArsenalDesPageTrailing extends StatefulWidget {
  const ArsenalDesPageTrailing({Key? key}) : super(key: key);

  @override
  State<ArsenalDesPageTrailing> createState() => _ArsenalDesPageTrailingState();
}

class _ArsenalDesPageTrailingState extends State<ArsenalDesPageTrailing> {
  var isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        CupertinoButton(
          padding: const EdgeInsets.only(right: 0),
          alignment: Alignment.centerRight,
          onPressed: () {
            setState(() {
              isSelect = !isSelect;
            });
          },
          child: Image(image: !isSelect ? R.image.navi_collect() : R.image.navi_collect_select(), color: Colors.blue),
        ),
        CupertinoButton(
          padding: const EdgeInsets.only(right: 0),
          alignment: Alignment.centerRight,
          onPressed: () {},
          child: Image(image: R.image.navi_more(), color: Colors.blue),
        ),
      ],
    );
  }
}

class ArsenalDesWidget extends StatelessWidget {
  const ArsenalDesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArsenalDesController c = Get.find<ArsenalDesController>();
    return SingleChildScrollView(
        child: Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: R.image.arsenal2_jpeg(),
                  ),
                ),
              )),
          for (var element in c.desTextListModels) ArsenalDesTextItem(desModel: element),
          const Padding(padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10), child: RecommendedItemBox())
        ],
      ),
    ));
  }
}

class ArsenalDesTextItem extends StatelessWidget {
  const ArsenalDesTextItem({Key? key, required this.desModel}) : super(key: key);
  final ArsenalDesTextItemModel desModel;

  void _handleTap() {
      RouteManager.jumpFeedBackPage(desModel.des);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            //背景径向渐变
            colors: [Colors.white, Colors.white],
            center: Alignment.topLeft,
            radius: .1,
          ),
          boxShadow: [
            //卡片阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 0),
              blurRadius: 1.0,
            )
          ],
        ),
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(desModel.itemTitle),
                ),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child:  GestureDetector(onTap: _handleTap, child: Text("纠错", style: TextStyle(color: Colors.black)) ,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                color: Colors.grey[300],
                child: Text(""),
                height: 1,
                width: double.infinity,
              ),
            ),
            Visibility(
                visible: desModel.countries == "" ? false : true,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(desModel.countries),
                    ))),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: (desModel.countries == "" ? 10.0 : 0)),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(desModel.des),
                )),
          ],
        ),
      ),
    );
  }
}

class RecommendedItemBox extends StatelessWidget {
  const RecommendedItemBox({Key? key}) : super(key: key);

  void _handleTap() {
      RouteManager.jumpArsenalDesPage();
  }

  @override
  Widget build(BuildContext context) {
    ArsenalDesController c = Get.find<ArsenalDesController>();
    return Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            //背景径向渐变
            colors: [Colors.white, Colors.white],
            center: Alignment.topLeft,
            radius: .1,
          ),
          boxShadow: [
            //卡片阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 0),
              blurRadius: 1.0,
            )
          ],
        ),
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("相关推荐"),
                ),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        ///
                      },
                      child: const Text("纠错", style: TextStyle(color: Colors.black)),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                color: Colors.grey[300],
                height: 1,
                width: double.infinity,
                child: Text(""),
              ),
            ),
            Row(
              children: [
                for (var i = 0; i < c.recommendedModels.length; i++)
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: (i % 2) == 0 ? 10 : 5, right: (i % 2) == 1 ? 10 : 5, top: 10, bottom: 15),
                    child: GestureDetector(onTap: _handleTap,child: RecommendedItem(recommendedModel: c.recommendedModels[i]),) ,
                  ))
              ],
            )
          ],
        ));
  }
}

// Padding(padding: EdgeInsets.all(5), child: RecommendedItem(recommendedModel: recommendedModel))

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({Key? key, required this.recommendedModel}) : super(key: key);
  final ArsenalDesRecommendedModel recommendedModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ArsenalListHorWidget(recommendedModel: recommendedModel),
        Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
            child: Text(
              recommendedModel.subTitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              overflow: TextOverflow.ellipsis,
            )),
        Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(
            recommendedModel.des,
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
  const ArsenalListHorWidget({Key? key, required this.recommendedModel}) : super(key: key);
  final ArsenalDesRecommendedModel recommendedModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 640 / 420.0,
        child: Stack(
          children: [
            AspectRatio(
                aspectRatio: 640 / 420.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0), child: Image(fit: BoxFit.cover, image: AssetImage("packages/com_3gtt_jsxw/assets/images/arsenal/arsenal${recommendedModel.img}.jpeg")))),
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
            HorizontalFullTextWidget(title: recommendedModel.title, alignment: Alignment.bottomCenter)
          ],
        ));
  }
}
