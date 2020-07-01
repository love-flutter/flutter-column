import 'package:flutter/material.dart';

/// name状态管理模块
class LikeNumModel with ChangeNotifier {
  /// 声明私有变量
  int _likeNum = 0;

  /// 设置get方法
  int get value => _likeNum;

  /// 修改当前name，随机选取一个
  void like() {
    print('like succes');
    _likeNum++;
    notifyListeners();
  }
}
