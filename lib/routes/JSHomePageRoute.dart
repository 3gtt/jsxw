import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:com_3gtt_jsxw/pages/JSHomePage.dart';
import 'package:com_3gtt_jsxw/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class JSHomePageRoute extends StatelessWidget {
  const JSHomePageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const [
        S.delegate,  //intl的delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,  //支持的国际化语言
      locale: const Locale('zh'),                       //可以设置当前的使用语言
      localeListResolutionCallback: (locales, supportedLocales) {
        if (kDebugMode) {
          print('当前系统语言环境$locales');
        }
        return;
      },
      title: '111',
      initialRoute: '/',
      theme: const CupertinoThemeData(
       primaryColor :  Colors.red
      ),
      routes: {
        '/': (context) => const JSHomePage()
      },
    );
  }
}
