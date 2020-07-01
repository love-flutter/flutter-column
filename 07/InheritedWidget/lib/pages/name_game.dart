import 'dart:math';

import 'package:flutter/material.dart';

import 'package:two_you_friend/inherited_widget/name_inherited_widget.dart';
import 'package:two_you_friend/widgets/name_game/random_name.dart';
import 'package:two_you_friend/widgets/name_game/test_other.dart';
import 'package:two_you_friend/widgets/name_game/welcome.dart';

/// 测试随机名字游戏组件
class NameGame extends StatefulWidget {
  /// 构造函数
  const NameGame({Key key}) : super(key: key);

  @override
  createState() => NameGameState();
}

/// 随机名字游戏组件状态管理类
class NameGameState extends State<NameGame> {
  /// name 状态
  String name;
  /// 构造函数参数，避免父组件状态变化，而引起的子组件的重 build 操作
  Widget child;

  /// 修改当前名字
  void changeName() {
    List<String> nameList = ['flutter one', 'flutter two', 'flutter three'];
    int pos = Random().nextInt(3);
    setState(() {
      name = nameList[pos];
    });
  }

  @override
  void initState() {
    setState(() {
      name = 'test flutter';
    });

    super.initState();
  }

  /// 构造函数
  NameGameState() {
    child = Column(children: <Widget>[
      Welcome(),
      RandomName(),
      TestOther(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NameInheritedWidget(child: child, onNameChange: changeName, name: name),
      ],
    );
  }
}
