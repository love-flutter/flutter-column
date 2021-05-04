import 'package:flutter/material.dart';

import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/pages/entrance.dart';
import 'package:two_you_friend/widgets/common/error.dart';
import 'package:two_you_friend/util/tools/app_provider.dart';
import 'package:two_you_friend/util/tools/app_sentry.dart';

/// APP 核心入口文件
void main() {
  AppSentry.runWithCatchError(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: AppProvider.getProviders(
          context,
          MaterialApp(
              title: 'Two You', // APP 名字
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue, // APP 主题
              ),
              routes:ProjectRouter().registerRouter(),
              home: Entrance()),
        ),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.error != null) {
            return Container(
              child: CommonError(),
            );
          }
          return Container(
            child: snapshot.data,
          );
        });
  }
}
