import 'package:flutter/material.dart';

import 'package:two_you_friend/widgets/common/red_message.dart';
import 'package:two_you_friend/util/struct/message.dart';
import 'package:two_you_friend/util/tools/time_format.dart';
import 'package:two_you_friend/styles/text_syles.dart';

/// 头部信息部分
class UserPageMessageCard extends StatelessWidget {
  /// 用户信息
  final StructUserMessage userMessage;

  /// 构造函数
  const UserPageMessageCard({Key key, this.userMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Row(children: <Widget>[
          Expanded(
            flex: 1,
            child: CommonRedMessage.showRedNumWidget(
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    userMessage.userInfo.headerUrl,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.contain,
                  ),
                ),
                userMessage.unReadNum),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getFirstLine(),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: <Widget>[
                    Text(
                      userMessage.messageInfo,
                      style: TextStyles.commonStyle(0.6, Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ],
            ),
          ),
        ]));
  }

  /// 获取时间行
  Widget _getMessageTimeSection(int messageTime) {
    String timeStr = TimeFormat.tsToTimeString(messageTime);
    return Text(
      timeStr,
      style: TextStyles.commonStyle(0.6),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// 获取右侧的首行
  Widget _getFirstLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          userMessage.userInfo.nickName,
          style: TextStyles.commonStyle(0.8, Colors.black),
        ),
        _getMessageTimeSection(userMessage.messageTime),
      ],
    );
  }
}
