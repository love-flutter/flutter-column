import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/name_model.dart';

import 'package:two_you_friend/widgets/name_game/random_name.dart';
import 'package:two_you_friend/widgets/name_game/test_other.dart';
import 'package:two_you_friend/widgets/name_game/welcome.dart';

/// 测试随机名字游戏组件
class NameGame extends StatelessWidget {
  /// 设置状态 name
  final name = NameModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Provider<String>.value(
          child: ChangeNotifierProvider.value(
            value: name,
            child: Column(
              children: <Widget>[
                Welcome(),
                RandomName(),
              ],
            ),
          ),
        ),
        TestOther(),
      ],
    );
  }
}