import 'package:flutter/material.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:get/utils.dart';

// 这是个比较复杂widget 解决一些特殊场景(比如Colum)无法使image宽度最大化的问题
class HorizontalFullImageWidget extends StatefulWidget {
  const HorizontalFullImageWidget(
      {Key? key, required this.index, required this.title})
      : super(key: key);
  final int index;
  final String title;

  @override
  State<HorizontalFullImageWidget> createState() =>
      _HorizontalFullImageWidgetState();
}

class _HorizontalFullImageWidgetState extends State<HorizontalFullImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                children: [
                  Image(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "packages/com_3gtt_jsxw/assets/images/arsenal/icon_${widget
                              .index}.png")),
                  const Opacity(
                    opacity: 0.6,
                    child: HorizontalFullBgWidget(
                        alignment: Alignment.bottomCenter
                    ),
                  ),
                  HorizontalFullTextWidget(title: widget.title,
                    alignment: Alignment.bottomCenter,)
                ],
              )),
        ],
      ),
    );
  }
}

class HorizontalFullTextWidget extends StatelessWidget {
  const HorizontalFullTextWidget(
      {Key? key, this.alignment = Alignment.topLeft, required this.title})
      : super(key: key);
  final Alignment alignment;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(color: Colors.white, fontSize: 17)),
    );
  }
}


class HorizontalFullBgWidget extends StatelessWidget {
  const HorizontalFullBgWidget({Key? key, this.alignment = Alignment.topLeft})
      : super(key: key);
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 25,
        ),
        child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
            )
        ),
      ),
    );
  }
}

