import 'dart:math';

import 'package:flutter/material.dart';

/// name状态管理模块
class NameModel with ChangeNotifier {
  /// 声明私有变量
  String _name = 'test flutter';

  /// 设置get方法
  String get value => _name;

  /// 修改当前name，随机选取一个
  void changeName() {
    List<String> nameList = ['flutter one', 'flutter two', 'flutter three'];
    int pos = Random().nextInt(3);

    if(_name != nameList[pos]) {
      _name = nameList[pos];
      notifyListeners();
    }
  }

}