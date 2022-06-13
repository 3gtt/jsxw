import 'package:cached_network_image/cached_network_image.dart';
import 'package:com_3gtt_jsxw/common/RouteManager.dart';
import 'package:com_3gtt_jsxw/model/new_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../controller/MilitaryOnlineController.dart';
import '../../common/GlobalVariable.dart';
import '../../widgets/PageSubViewCacheWidget.dart';

class MilitaryOnlineTabPage extends StatelessWidget {
  const MilitaryOnlineTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        backgroundColor: CupertinoColors.systemBackground,
        child: SafeArea(
          child: Material(
            child: GetBuilder(init: MilitaryOnlineController(), builder: (context) => ControlAndPageView()),
          ),
        )
    );
  }
}

// ignore: must_be_immutable
class ControlAndPageView extends StatelessWidget {
  ControlAndPageView({Key? key}) : super(key: key);
  final controlKey = GlobalKey<ControlWidgetState>();
  MilitaryOnlineController c = Get.find<MilitaryOnlineController>();


  void _pageCurrentChangeIndex(int index) {
    c.currentIndex.value = index;
    controlKey.currentState?.jumpTo(index);
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Column(
      children: [
        ControlWidget(
            key: controlKey,
            controlTitles: const ["推荐", "热点", "军事", "文章", "历史"],
            valueChanged: (index) {
              c.currentIndex.value = index;
              controller.jumpToPage(index);
            }),
        Expanded(child: PageViewWidget(count: 5, controller: controller, pageCurrentChangeIndex: _pageCurrentChangeIndex)),
      ],
    );
  }
}

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key, required this.count, required this.controller, required this.pageCurrentChangeIndex}) : super(key: key);
  final int count;
  final PageController controller;
  final ValueChanged<int> pageCurrentChangeIndex;

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  MilitaryOnlineController c = Get.find<MilitaryOnlineController>();
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (var i = 0; i < widget.count; i++) {
      children.add(KeepAliveWrapper(child: Obx(() => PageListWidget(data: c.newListModels[i]))));
    }
    return PageView(
        controller: widget.controller,
        onPageChanged: (index) {
          widget.pageCurrentChangeIndex(index);
        },
        children: children
    );
  }
}

/// 这个是pageView中的界面
class PageListWidget extends StatefulWidget {
  const PageListWidget({Key? key, required this.data}) : super(key: key);
  final Data? data;
  @override
  State<PageListWidget> createState() => _PageListWidgetState();
}

class _PageListWidgetState extends State<PageListWidget> {
  final RefreshController _refreshController = RefreshController(initialRefresh: true);
  MilitaryOnlineController c = Get.find<MilitaryOnlineController>();

  /// 下拉刷新
  void _onRefresh() {
      c.request(c.currentIndex.value, false, (e){
        c.newListModels.refresh();
        _refreshController.refreshCompleted();
      });
  }
  ///上拉加载
  void _onLoading() {
    c.request(c.currentIndex.value, true,(e){
      c.newListModels.refresh();
      _refreshController.loadComplete();
    });
  }

  void _handleTap(int index) {
      RouteManager.jumpNewListDesPage( {"id" : widget.data?.newsLists[index].id ?? "", "timeAge" :widget.data?.newsLists[index].timeAgo ?? "" });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const ClassicHeader(),
        footer: const ClassicFooter(),
        controller: _refreshController,
        onLoading: _onLoading,
        onRefresh: _onRefresh,
        child: ListView.separated(
          itemCount: widget.data?.newsLists.length ?? 0,
            itemBuilder: (context, index) {
            // Logger().d(widget.data?.newsLists.length);
              return ListTile(
                onTap: () => _handleTap(index),
                  dense: true,
                  contentPadding: const EdgeInsets.all(0),
                  title: ((widget.data?.newsLists.length ?? 0) <= index) ? Container() : MOListItem(newsList: widget.data?.newsLists[index]),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return Divider(indent: 15, color: Colors.grey[400],);
        },
        ),
    );
  }
}

class MOListItem extends StatelessWidget {
  const MOListItem({Key? key, required this.newsList}) : super(key: key);
  final NewsLists? newsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 5,top: 5,left: 15, right: 15),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: AspectRatio(
                  aspectRatio: 400 / 263.0,
                  child: Image(fit: BoxFit.fill, image: CachedNetworkImageProvider(newsList?.picList.first ?? "")),
              ),
            ),

            Expanded(
                child: SizedBox(height: 80, child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10,),
                          child: SizedBox(width: double.infinity, child: Text(newsList?.title ?? "", style: const TextStyle(fontSize: 19), maxLines: 2, overflow: TextOverflow.ellipsis),)
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(padding: const EdgeInsets.only(left: 10), child: Text(newsList?.timeAgo ?? "", style: const TextStyle(fontSize: 10),),),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(padding: const EdgeInsets.only(left: 10), child: Text("${newsList?.commentNum ?? ""}评论", style: TextStyle(fontSize: 10, color: Colors.grey[500]))),
                    ),
                  ],
                ),)
            )

          ],
        ),
      ),
    );

  }
}

/// 这个是分栏控制器
// ignore: must_be_immutable
class ControlWidget extends StatefulWidget {
  const ControlWidget({
    Key? key,
    this.controlTitles,
    this.valueChanged,
    this.textStyle,
    this.selectTextStyle,
    this.sliderColor,
  }) : super(key: key);

  final List<String>? controlTitles;
  final ValueChanged<int>? valueChanged;
  final TextStyle? textStyle;
  final TextStyle? selectTextStyle;
  final Color? sliderColor;

  @override
  State<ControlWidget> createState() => ControlWidgetState();

  void valueChange(int index) {
    if (valueChanged != null) {
      valueChanged!(index);
    }
  }
}

class ControlWidgetState extends State<ControlWidget> {
  int currentIndex = 0;

  void jumpTo(int index) {
    _refresh(index);
  }

  void _handleTap(int index) {
    widget.valueChange(index);
    _refresh(index);
  }

  void _refresh(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.textStyle ?? const TextStyle(fontSize: 16, color: Colors.black);
    final selectTextStyle = widget.selectTextStyle ?? const TextStyle(fontSize: 16, color: Colors.red);
    final sliderColor = widget.sliderColor ?? Colors.red;

    var children = <Widget>[];
    for (var i = 0; i < (widget.controlTitles?.length ?? 0); i++) {
      children.add(Expanded(
          child: GestureDetector(
              onTap: () => _handleTap(i),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  widget.controlTitles?[i] ?? "",
                  style: (i == currentIndex) ? selectTextStyle : textStyle,
                  textAlign: TextAlign.center,
                ),
              ))));
    }

    final itemWidth = (Get.size.width / children.length);
    final itemTextWidth = boundingTextSize(widget.controlTitles?[0] ?? "", textStyle).width;
    final itemDx = (itemWidth / 2) - (itemTextWidth / 2) + (currentIndex * itemWidth);

    return SizedBox(
        width: double.infinity,
        height: 50,
        child: Stack(
          children: [
            const Positioned(left: 0, top: -0.6, right: 0, child: Divider(height: 1, color: Colors.black54)),
            Row(
              children: children,
            ),
            const Positioned(left: 0, bottom: 1, right: 0, child: Divider(height: 1, color: Colors.black54)),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              left: itemDx,
              bottom: 2,
              child: Container(
                color: sliderColor,
                width: itemTextWidth,
                height: 2,
              ),
            ),
          ],
        ));
  }
}
