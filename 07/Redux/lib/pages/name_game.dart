import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:two_you_friend/widgets/name_game/random_name.dart';
import 'package:two_you_friend/widgets/name_game/test_other.dart';
import 'package:two_you_friend/widgets/name_game/welcome.dart';

/// 测试随机名字游戏组件
class NameGame extends StatelessWidget {
  /// store
  final Store store;

  /// 构造函数
  NameGame({Key key, this.store}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Welcome(store: store),
        RandomName(store: store),
        TestOther(),
      ],
    );
  }
}