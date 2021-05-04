import 'package:flutter/material.dart';

import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/pages/entrance.dart';

/// APP 核心入口文件
void main() {
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Two You', // APP 名字
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue, // APP 主题
        ),
        routes: ProjectRouter().registerRouter(),
//        onGenerateRoute: (RouteSettings settings) {
//          returnProjectRouter().generateRoute(
//              settings.name,
//              settings.arguments
//          );
//        },
        home: Scaffold(
            appBar: AppBar(
              title: Text('Two You'), // 页面名字
            ),
            body: Center(
              child: Entrance(),
            )));
  }
}
