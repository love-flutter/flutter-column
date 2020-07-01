import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:two_you_friend/states/name_states.dart';


/// 欢迎人展示组件
class Welcome extends StatelessWidget {
  /// store
  final Store store;

  /// 构造函数
  Welcome({Key key, this.store}) : super(key: key);

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('welcome build');
    return  StoreConnector<NameStates,String>(
      converter: (store) => store.state.name.toString(),
      builder: (context, name) {
        return Text('欢迎 $name');
      },
    );
  }
}
