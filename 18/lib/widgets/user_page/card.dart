import 'package:flutter/material.dart';

import 'package:two_you_friend/router.dart';
import 'package:two_you_friend/styles/text_syles.dart';
import 'package:two_you_friend/util/struct/user_info.dart';

/// 头部信息部分
class UserPageCard extends StatelessWidget {
  /// 用户信息
  final StructUserInfo userInfo;

  /// 构造函数
  const UserPageCard({Key key, this.userInfo});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(10),
      onPressed: () => Router()
          .open(context, "tyfapp://userpageguest?userId=${userInfo.uid}"),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              userInfo.headerUrl,
              width: 40.0,
              height: 40.0,
              fit: BoxFit.fill,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            userInfo.nickName,
            style: TextStyles.commonStyle(1),
          ),
        ],
      ),
    );
  }
}
