import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:com_3gtt_jsxw/controller/FeedBackController.dart';


class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("联系开发者"),
        previousPageTitle: "运20",
      ),
      child: GetBuilder(init: FeedBackController(), builder: (context) => const SafeArea(child: FeedBackWidget())),
    );
  }
}

class FeedBackWidget extends StatefulWidget {
  const FeedBackWidget({Key? key}) : super(key: key);

  @override
  State<FeedBackWidget> createState() => _FeedBackWidgetState();
}

class _FeedBackWidgetState extends State<FeedBackWidget> {
  final TextEditingController _textController = TextEditingController();
  FeedBackController c = Get.find<FeedBackController>();

  @override
  void initState() {
    super.initState();
    _textController.text = Get.arguments ?? "";
  }

  void _sendTap() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      c.text.value = _textController.text;
    });
  }

  void _clean() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "输入你想修改或添加的功能，让我们一起完善App，\n我们会在App Store页面更新开发进度。",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              maxLines: 10,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  height: 250,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[400] ?? Colors.red)),
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 2),
                      child: Material(
                          child: TextField(
                            controller: _textController,
                              maxLines: null,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200] ?? Colors.red,
                                  filled: true,
                                  border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(fontSize: 14, height:1.2, color: Colors.grey[700])))))),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.deepOrange,
                child: TextButton(
                  onPressed: _sendTap,
                  child: const Text(
                    "发送",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5, top: 0, bottom: 0),
            child: Row(
              children: [
                const Text(
                  "反馈历史:",
                  style: TextStyle(fontSize: 14),
                ),
                const Spacer(),
                SizedBox(
                  width: 50,
                  child: TextButton(
                      onPressed: _clean,
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: Text("清空"),
                      )),
                ),
              ],
            ),
          ),
          
          Padding(padding: const EdgeInsets.all(10),child: Obx(() => Text(c.text.value,style: TextStyle(fontSize: 14, height:1.2, color: Colors.grey[700])))),
          
          
        ],
      ),
    );
  }
}
