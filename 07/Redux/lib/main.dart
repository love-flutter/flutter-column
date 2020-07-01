import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:two_you_friend/pages/name_game.dart';
import 'package:two_you_friend/states/name_states.dart';


/// APP 核心入口文件
void main() {
  final store =
  Store<NameStates>(reducer, initialState: NameStates.initState());
  runApp(MyApp(store));
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  /// 初始
  final Store<NameStates> store;
  /// 构造函数
  MyApp(this.store);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<NameStates>(
      store: store,
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
                child: NameGame(store: store),
              ))),
    );
  }
}
