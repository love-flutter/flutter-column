import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:two_you_friend/router.dart';
import 'package:two_you_friend/model/like_num_model.dart';
// 底部导航栏
import 'package:two_you_friend/pages/entrance.dart';

/// APP 核心入口文件
void main() {
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  /// like num data
  final likeNumModel = LikeNumModel();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<Map<String, int>>.value(
        value: {},
        child: ChangeNotifierProvider.value(
          value: likeNumModel,
          child: MaterialApp(
              title: 'Two You', // APP 名字
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue, // APP 主题
              ),
              routes: Router().registerRouter(),
              home: Entrance()),
        ));
  }
}
