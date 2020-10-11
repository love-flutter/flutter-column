import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/model/new_message_model.dart';
import 'package:two_you_friend/widgets/common/red_message.dart';

/// 个人页面的功能列表
class UserPageButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newMessageModel = Provider.of<NewMessageModel>(context);

    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.person_pin),
          title: Text('我的好友'),
          onTap: () {
            ProjectRouter().open(context, "tyfapp://followlistpage");
          },
        ),
        ListTile(
          leading: CommonRedMessage.showRedNumWidget(
              Icon(Icons.email), newMessageModel.value),
          title: Text('我的消息'),
          onTap: () {
            newMessageModel.readNewMessage();
            ProjectRouter().open(context, "tyfapp://usermessage");
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('系统设置'),
          onTap: () {
            ProjectRouter().open(context, "tyfapp://systemconfigpage");
          },
        )
      ],
    );
  }
}
