import 'package:flutter/material.dart';

import 'package:two_you_friend/widgets/user_page/button_list.dart';
import 'package:two_you_friend/widgets/user_page/header.dart';

/// 首页
class UserPageIndex extends StatelessWidget {
  /// 构造函数
  const UserPageIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserPageHeader(),
        Divider(height: 1.0, indent: 70, color: Colors.grey),
        Expanded(
          child: UserPageButtonList(),
        ),
      ],
    );
  }
}
