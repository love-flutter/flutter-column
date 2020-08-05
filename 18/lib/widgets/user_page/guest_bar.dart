import 'package:flutter/material.dart';

import 'package:two_you_friend/styles/text_syles.dart';
import 'package:two_you_friend/util/struct/user_info.dart';

/// 头部信息部分
class UserPageGuestBar extends StatelessWidget {
  /// 用户信息
  final StructUserInfo userInfo;

  /// 构造函数
  const UserPageGuestBar({Key key, this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.local_post_office,
              size: 30,
              color: Colors.lightBlueAccent,
            ),
            Padding(padding: EdgeInsets.only(left: 20)),
            Icon(
              Icons.trending_up,
              size: 30,
              color: Colors.lightBlueAccent,
            ),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(
              '1245',
              style: TextStyles.commonStyle(1, Colors.lightBlueAccent),
            ),
          ],
        ));
  }
}
