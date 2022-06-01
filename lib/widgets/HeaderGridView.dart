import 'package:flutter/cupertino.dart';

class HeadGridView extends StatelessWidget {
  final List<Widget> headers;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final SliverGridDelegate gridDelegate;
  final ScrollController controller;
  final EdgeInsetsGeometry? padding;

  const HeadGridView(
      {Key? key,
        this.headers = const [],
        required this.itemCount,
        required this.gridDelegate,
        required this.controller,
        this.padding,
        required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: padding,
      children: [
        ...headers,
        GridView.builder(
            padding: padding,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            gridDelegate: gridDelegate,
            itemBuilder: itemBuilder)
      ],
    );
  }
}