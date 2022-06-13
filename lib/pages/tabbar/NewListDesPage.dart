import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../common/GlobalVariable.dart';
import '../../common/RouteManager.dart';
import '../../controller/NewListDesController.dart';
import '../../model/new_list_comment_model.dart';
import '../../model/new_list_des_model.dart';
import '../../r.g.dart';

class NewListDesPage extends StatelessWidget {
  NewListDesPage({Key? key}) : super(key: key);
  final screenshotController = ScreenshotController();

  // 保存到本地相册
  void screenshot() async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    int fileName = DateTime
        .now()
        .microsecondsSinceEpoch;
    var path = directory;
    screenshotController.captureAndSave(path, fileName: "{$fileName}.jpg").then((path) {
      if (path != null) {
        logger.d(path);
        ImageGallerySaver.saveFile(path).then((value) {
          Get.showSnackbar(const GetSnackBar(message: "保存成功", duration: Duration(milliseconds: 2500)));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: "军情在线",
          trailing: NewListDesPageTrailing(
            screenshot: screenshot,
          ),
        ),
        backgroundColor: CupertinoColors.systemBackground,
        child: SafeArea(
          child: Material(
            child: GetBuilder(init: NewListDesController(), builder: (context) {
              return const NewListWidget();
            }),
          ),
        ));
  }
}

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}


class NewListWidget extends StatefulWidget {
  const NewListWidget({Key? key}) : super(key: key);

  @override
  State<NewListWidget> createState() => _NewListWidgetState();
}

class _NewListWidgetState extends State<NewListWidget> {
  final RefreshController _refreshController = RefreshController(initialRefresh: true);
  NewListDesController c = Get.find<NewListDesController>();
  ///上拉加载
  void _onLoading() {
    c.loadMoreCommentModels(() {
      _refreshController.loadComplete();
      if (c.newListDesModels[1].isNoMore == true) {
        _refreshController.loadNoData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      return c.newListDesModels[0].newListDesModel == null ? const ActivityWidget() : SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          footer: const ClassicFooter(),
          controller: _refreshController,
          onLoading: _onLoading,
          child: SingleChildScrollView(
            child: ScrollContentWidget(),
          )
      );
    });
  }
}

// ignore: must_be_immutable
class ScrollContentWidget extends StatelessWidget {
  ScrollContentWidget({Key? key}) : super(key: key);
  NewListDesController c = Get.find<NewListDesController>();

  _handleIsShowWebMore() {
    c.isShowWebMore.value = !c.isShowWebMore.value;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const TitleWidget(),
          const UserPublishWidget(),
          Obx(() => c.newListDesModels[0].newListDesModel == null ? Container() : const NewListDesWidget()),
          Obx(() =>
              Offstage(
                offstage: c.isShowWebMore.value,
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                      child: GestureDetector(
                        onTap: _handleIsShowWebMore,
                        child: Container(
                          constraints: const BoxConstraints.tightFor(width: 170.0, height: 40),
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 0.5), borderRadius: BorderRadius.circular(18), color: Colors.blue.shade50),
                          child: const Center(
                            child: Text(
                              "点击展开全文",
                              style: TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ),
                        ),
                      )),
                ),
              )),
          Padding(padding: EdgeInsets.only(left: 15, top: 20, bottom: 10), child: Container(width: double.infinity, child: const Text("相关推荐"))),
          Divider(
            indent: 15,
            endIndent: 15,
            height: 1,
            color: Colors.grey[500],
          ),
          Obx(() => c.newListDesModels[0].newListDesModel == null ? Container() : NewsListWidget(aboutNews: c.newListDesModels[0].newListDesModel?.data.aboutNews)),
          Divider(
            indent: 15,
            endIndent: 15,
            height: 1,
            color: Colors.grey[500],
          ),
          Obx(() => c.newListDesModels[1].feedback == null ? Container() : FeedBackWidget())
        ],
      ),
    );
  }
}


///这个是评论
class FeedBackWidget extends StatelessWidget {
  const FeedBackWidget({Key? key}) : super(key: key);

  void _handleTap(BuildContext context) {
    _showActionSheet(context);
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          CupertinoActionSheet(
            title: const Text('请选择'),
            cancelButton: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "取消",
                )),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
                  // Navigator.pop(context);
                  Get.showSnackbar(GetSnackBar(message: "复制成功", duration: Duration(milliseconds: 2500),));
                },
                child: const Text('复制'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  Get.showSnackbar(GetSnackBar(message: "回复成功", duration: Duration(milliseconds: 2500),));
                },
                child: const Text('回复'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  Get.showSnackbar(GetSnackBar(message: "举报成功", duration: Duration(milliseconds: 2500),));
                },
                child: const Text('举报'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    NewListDesController c = Get.find<NewListDesController>();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => _handleTap(context),
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          title: (c.newListDesModels[1].feedback?.data.commentList[index] != null) ? FeedBackItem(commentModel: c.newListDesModels[1].feedback?.data.commentList[index]) : Container(),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(indent: 15, height: 0.5, color: Colors.grey[500]);
      },
      itemCount: c.newListDesModels[1].feedback?.data.commentList.length ?? 0,
    );
  }
}


class FeedBackItem extends StatelessWidget {
  const FeedBackItem({Key? key, required this.commentModel}) : super(key: key);
  final CommentList? commentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(width: 30, height: 30, child: Image(image: CachedNetworkImageProvider(commentModel?.userImg ?? ""))),
                ),
              ),
              Expanded(
                  flex: (Get.width / 45).round(),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 5), child: SizedBox(width: double.infinity, child: Text(commentModel?.userName ?? "", style: TextStyle(color: Colors.blue,
                            fontSize: 16))),),
                        Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  commentModel?.content ?? "",
                                  style: TextStyle(fontSize: 16),
                                  maxLines: null,
                                )
                            )
                        ),
                        Padding(padding: EdgeInsets.only(top: 10), child: SizedBox(width: double.infinity, child: Text(commentModel?.publishTime ?? "", style: TextStyle(fontSize: 10,
                            color: Colors.grey[500])))),
                      ],
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}


/// 这个是相关推荐
class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key, required this.aboutNews}) : super(key: key);
  final List<AboutNews>? aboutNews;

  @override
  State<NewsListWidget> createState() => _PageListWidgetState();
}

class _PageListWidgetState extends State<NewsListWidget> {

  void _handleTap(int index) {
    RouteManager.jumpNewListDesPage({"id": widget.aboutNews?[index].id ?? "", "timeAge": widget.aboutNews?[index].timeAgo ?? ""});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.aboutNews?.length ?? 0,
      itemBuilder: (context, index) {
        // Logger().d(widget.data?.newsLists.length);
        return ListTile(
          onTap: () => _handleTap(index),
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          title: ((widget.aboutNews?.length ?? 0) <= index) ? Container() : MOListItem(newsList: widget.aboutNews?[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          indent: 15,
          color: Colors.grey[400],
        );
      },
    );
  }
}

class MOListItem extends StatelessWidget {
  const MOListItem({Key? key, required this.newsList}) : super(key: key);
  final AboutNews? newsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5, left: 15, right: 15),
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
                child: SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(newsList?.title ?? "", style: const TextStyle(fontSize: 19), maxLines: 2, overflow: TextOverflow.ellipsis),
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            newsList?.timeAgo ?? "",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(padding: const EdgeInsets.only(left: 10), child: Text("${newsList?.commentNum ?? ""}评论", style: TextStyle(fontSize: 10, color: Colors.grey[500]))),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class UserPublishWidget extends StatelessWidget {
  const UserPublishWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewListDesController c = Get.find<NewListDesController>();
    return Obx(() =>
        Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 40),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: SizedBox(width: 50, height: 50, child: Image(image: CachedNetworkImageProvider(c.newListDesModels[0].newListDesModel?.data.authorIconUrl ?? ""))),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    width: double.infinity,
                    height: 50,
                    child: Column(
                      children: [
                        SizedBox(width: double.infinity, child: Text(c.newListDesModels[0].newListDesModel?.data.authorNickName ?? "", style: TextStyle(color: Colors.blue, fontSize: 12))),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              Get.arguments["timeAge"],
                              style: TextStyle(color: Colors.grey[500], fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Text(c.newListDesModels[0].newListDesModel?.data.authorNickName ?? "", style: TextStyle(color: Colors.blue, fontSize: 12)),
              ],
            )));
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewListDesController c = Get.find<NewListDesController>();
    return Padding(
      padding: EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        child: Obx(() =>
            Text(
              c.newListDesModels[0].newListDesModel?.data.title ?? "",
              maxLines: null,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}

class NewListDesWidget extends StatelessWidget {
  const NewListDesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewListDesController c = Get.find<NewListDesController>();
    return Obx(() =>
        SizedBox(
          height: (c.isShowWebMore.value ? c.webViewHeight.value : c.webViewHeightIdEnt),
          child: WebView(
              gestureNavigationEnabled: true,
              zoomEnabled: false,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                c.controller = controller;
                String htmlStr = c.newListDesModels[0].newListDesModel?.data.webContent ?? "";
                controller.loadHtmlString(htmlStr);
              },
              javascriptChannels: {
                JavascriptChannel(
                    name: "Resize",
                    onMessageReceived: (JavascriptMessage message) {
                      double height = double.parse(message.message);
                      c.webViewHeight.value = height;
                    })
              }),
        ));
  }
}

class NewListDesPageTrailing extends StatefulWidget {
  const NewListDesPageTrailing({Key? key, required this.screenshot}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final screenshot;

  @override
  State<NewListDesPageTrailing> createState() => _NewListDesPageTrailingState();
}

class _NewListDesPageTrailingState extends State<NewListDesPageTrailing> {
  var isSelect = false;

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          CupertinoActionSheet(
            title: const Text('更多'),
            cancelButton: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "取消",
                )),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
                  // Navigator.pop(context);
                  Get.offAllNamed("/");
                },
                child: const Text('回到首页'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  widget.screenshot();
                },
                child: const Text('保存长图'),
              ),
            ],
          ),
    );
  }

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
          child: Icon(CupertinoIcons.add),
        ),
        CupertinoButton(
          padding: const EdgeInsets.only(right: 0),
          alignment: Alignment.centerRight,
          onPressed: () {
            _showActionSheet(context);
          },
          child: Image(image: R.image.navi_more(), color: Colors.blue),
        ),
      ],
    );
  }
}
