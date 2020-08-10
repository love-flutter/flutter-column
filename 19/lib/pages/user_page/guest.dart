import 'package:flutter/material.dart';

import 'package:two_you_friend/api/user_info/index.dart';
import 'package:two_you_friend/util/tools/json_config.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/widgets/common/error.dart';
import 'package:two_you_friend/widgets/user_page/content_list.dart';
import 'package:two_you_friend/widgets/user_page/guest_bar.dart';
import 'package:two_you_friend/widgets/user_page/guest_header.dart';

/// 客人态页面
class UserPageGuest extends StatelessWidget {
  /// 用户id
  final String userId;

  /// 构造函数
  const UserPageGuest({Key key, this.userId});

  @override
  Widget build(BuildContext context) {
    String id = userId;
    if (userId == null && ModalRoute.of(context).settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context).settings.arguments);
      id = dataInfo['userId'].toString();
    }
    return FutureBuilder<Widget>(
        future: _getWidget(id),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.error != null) {
            return Container(
              child: CommonError(),
            );
          }
          return Container(
            child: snapshot.data,
          );
        });
  }

  Future<Widget> _getWidget(String id) async {
    StructUserInfo userInfo = await ApiUserInfoIndex.getOneById(id);
    if (userInfo == null) {
      return CommonError();
    }
    return Container(
      child: Column(
        children: <Widget>[
          UserPageGuestHeader(userInfo: userInfo),
          Divider(
              height: 1,
              color: Colors.lightBlueAccent,
              indent: 10,
              endIndent: 10),
          UserPageGuestBar(userInfo: userInfo),
          Expanded(
            child: UserPageContentList(id: id),
          ),
        ],
      ),
    );
  }
}
