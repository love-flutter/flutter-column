import 'package:flutter/material.dart';

/// name状态管理模块
class LikeNumModel with ChangeNotifier {
  /// 声明私有变量
  Map<String, int> _likeInfo;

  /// 设置初始like num
  void setLikeNum(String articleId, int likeNum) {
    if (_likeInfo == null) {
      _likeInfo = {};
    }
    if (articleId == null) {
      return;
    }
    _likeInfo[articleId] = likeNum;
  }

  /// 设置get方法
  int getLikeNum(String articleId, [int likeNum = 0]) {
    if (_likeInfo == null) {
      _likeInfo = {};
    }
    if (articleId == null) {
      return likeNum;
    }
    if (_likeInfo[articleId] == null) {
      _likeInfo[articleId] = likeNum;
    }

    return _likeInfo[articleId];
  }

  /// 修改当前name，随机选取一个
  void like(String articleId) {
    if (_likeInfo == null || articleId == null) {
      _likeInfo = {};
    }
    if (_likeInfo == null || _likeInfo[articleId] == null) {
      _likeInfo[articleId] = 0;
    }
    _likeInfo[articleId] = _likeInfo[articleId] + 1;
    notifyListeners();
  }
}
