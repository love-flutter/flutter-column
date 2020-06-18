import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 需要在pubspec.yaml增加该模块


/// APP 首页入口
///
/// 本模块函数，加载状态类组件HomePageState
class HomePage extends StatefulWidget {
  @override
  createState() => HomePageState();
}

/// 首页有状态组件类
///
/// 主要是获取当前时间，并动态展示当前时间
class HomePageState extends State<HomePage> {
  /// 获取当前时间戳
  ///
  /// [prefix]需要传入一个前缀信息
  /// 返回一个字符串类型的前缀信息：时间戳
  String getCurrentTime(String prefix) {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yy-mm-dd H:m:s');
    String nowTime = formatter.format(now);

    return '$prefix $nowTime';
  }

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    return Text(
        getCurrentTime('当前时间')
    );
  }
}