import 'package:flutter/cupertino.dart';
import 'package:com_3gtt_jsxw/r.g.dart';

class MilitaryOnlineTabPage extends StatefulWidget {
  const MilitaryOnlineTabPage({Key? key}) : super(key: key);

  @override
  State<MilitaryOnlineTabPage> createState() => _MilitaryOnlineTabPageState();
}

class _MilitaryOnlineTabPageState extends State<MilitaryOnlineTabPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar:  CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.systemBackground,
      child:  Center(

        child: Text('222222'),
      ),
    );
  }
}