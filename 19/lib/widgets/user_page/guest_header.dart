import 'package:flutter/material.dart';

import 'package:two_you_friend/styles/text_syles.dart';
import 'package:two_you_friend/util/struct/user_info.dart';

/// 头部信息部分
class UserPageGuestHeader extends StatelessWidget {
  /// 用户信息
  final StructUserInfo userInfo;

  /// 构造函数
  const UserPageGuestHeader({Key key, this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            flex: 5,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    userInfo.headerUrl,
                    width: 60,
                    height: 60,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  userInfo.nickName,
                  style: TextStyles.commonStyle(),
                ),
                Padding(padding: EdgeInsets.only(bottom: 120)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.lightBlueAccent,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 20)),
        ],
      ),
    );
  }
}
