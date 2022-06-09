import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/SearchArsenalPageController.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:com_3gtt_jsxw/widgets/HorizontalFullImageWidget.dart';
import 'package:com_3gtt_jsxw/r.g.dart';


class SearchArsenalPage extends StatelessWidget {
  const SearchArsenalPage({Key? key}) : super(key: key);

  void _onSearchTextFieldSubmitted(String value) {
    SearchArsenalPageController c = Get.find<SearchArsenalPageController>();
    c.createData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: Get.arguments ?? "",
          middle: CupertinoSearchTextField(
            placeholder: "天下兵器，唯快不破",
            autofocus: true,
            onSubmitted: _onSearchTextFieldSubmitted,
          ),
          trailing: Container(width: Get.size.width / 7),
        ),
        child: GetBuilder(
          init: SearchArsenalPageController(),
          builder: (context) {
            return const SafeAreaWidget();
          },
        ));
  }
}

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: RefreshWidget());
  }
}

class RefreshWidget extends StatefulWidget {
  const RefreshWidget({Key? key}) : super(key: key);
  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  final RefreshController _refreshController = RefreshController(
      initialRefresh: true
  );
  SearchArsenalPageController c = Get.find<SearchArsenalPageController>();

  @override
  void initState() {
    super.initState();
  }

  void _onLoading() async {
    c.mock((){
      _refreshController.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        footer: const ClassicFooter(
            idleText: "",
            idleIcon: null
        ),
        controller: _refreshController,
        onLoading: _onLoading,
        child:  GridView.builder(
            itemCount: c.arsenalModels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              childAspectRatio: 1.05,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10, top: 10,bottom: 0),
                  child:   ArsenalListGridItem(index: index));
            })
    ));

  }
}

class ArsenalListGridItem extends StatelessWidget {
  const ArsenalListGridItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var c = Get.find<SearchArsenalPageController>();
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
    var c = Get.find<SearchArsenalPageController>();

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
