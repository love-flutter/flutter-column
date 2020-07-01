import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/name_model.dart';

/// 欢迎人展示组件
class Welcome extends StatelessWidget {

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    final _name = Provider.of<NameModel>(context);

    print('welcome build');
    return Text('欢迎 ${_name.value}');
  }
}
