import 'package:com_3gtt_jsxw/pages/MilitaryOnlineTabPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:com_3gtt_jsxw/generated/l10n.dart';
import 'package:com_3gtt_jsxw/r.g.dart';
import 'package:flutter/material.dart';
import 'package:com_3gtt_jsxw/pages/ArsenalTabPage.dart';

class _TabInfo {
  const _TabInfo(this.title, this.img);

  final String title;
  final Image img;
}

class JSHomePage extends StatefulWidget {
  const JSHomePage({Key? key}) : super(key: key);

  @override
  State<JSHomePage> createState() => _JSHomePageState();
}

class _JSHomePageState extends State<JSHomePage> {
  var tabInfos = [
    _TabInfo(
        S.current.homeTabr1Title,
        Image(
          image: R.image.tabbar_1(),
        )),
    _TabInfo(
        S.current.homeTabr2Title,
        Image(
          image: R.image.tabbar_2(),
        )),
    _TabInfo(
        S.current.homeTabr3Title,
        Image(
          image: R.image.tabbar_3(),
        )),
    _TabInfo(
        S.current.homeTabr4Title,
        Image(
          image: R.image.tabbar_4(),
        )),
  ];

  void _handleTabBarOnTap(int index) {}

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            currentIndex: 1,
            items: [
              for (final tabInfo in tabInfos)
                BottomNavigationBarItem(
                  label: tabInfo.title,
                  icon: ImageIcon(tabInfo.img.image),
                )
            ],
            onTap: _handleTabBarOnTap,
          ),
          // 根据不同的index 生成不同的page
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (context) => index != 1 ? MilitaryOnlineTabPage() : ArsenalTabPage(),
              defaultTitle: tabInfos[index].title,
            );
          },
        ));
  }
}
