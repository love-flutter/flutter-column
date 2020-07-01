import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/pages/home_page.dart';

/// APP 核心入口文件
void main() {
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  /// 创建 like model
  final likeNumModel = LikeNumModel();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<int>.value(
      child: ChangeNotifierProvider.value(
        value: likeNumModel,
        child: MaterialApp(
            title: 'Two You', // APP 名字
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue, // APP 主题
            ),
            home: Scaffold(
                appBar: AppBar(
                  title: Text('Two You'), // 页面名字
                ),
                body: Center(
                  //child: HomePage(),
                  child: HomePage(),
                ))),
      ),
    );
  }
}
