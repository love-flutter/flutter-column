import 'package:flutter/material.dart';

import 'package:two_you_friend/util/tools/json_config.dart';

/// 首页
class UserPageIndex extends StatelessWidget {
  /// 用户 ID 信息
  final String userId;

  /// 构造函数
  const UserPageIndex({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String myUserId = userId;
    if (ModalRoute.of(context).settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context).settings.arguments);
      myUserId = dataInfo['userId'].toString();
    }

    // TODO: implement build
    return Text('I am use page ${myUserId}');
  }
}
