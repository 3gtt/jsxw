import 'package:flutter/material.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
// 这是个比较复杂widget 解决一些特殊场景(比如Colum)无法使image宽度最大化的问题
class HorizontalFullImageWidget extends StatefulWidget {
  const HorizontalFullImageWidget({Key? key}) : super(key: key);

  @override
  State<HorizontalFullImageWidget> createState() =>
      _HorizontalFullImageWidgetState();
}

class _HorizontalFullImageWidgetState extends State<HorizontalFullImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    //剪裁为圆角矩形
                      borderRadius: BorderRadius.circular(5.0),
                      child:
                      Image(fit: BoxFit.fill, image: R.image.icon_all())),
                  const Center(
                      child: Text("全部武器",
                          style: TextStyle(color: Colors.white, fontSize: 32)))
                ],
              )),
        ],
      ),
    );
  }
}
