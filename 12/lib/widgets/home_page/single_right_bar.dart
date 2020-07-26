import 'package:flutter/material.dart';

import 'package:two_you_friend/styles/text_syles.dart';

/// 贴子下面的信息栏
///
/// 包括用户头像、昵称和评论信息，但不包括点赞，因为点赞为动态组件
/// 需要参数[nickname]、[headerImage]、[commentNum]
class SingleRightBar extends StatelessWidget {
  /// 用户昵称
  final String nickname;

  /// 用户头像
  final String headerImage;

  /// 评论数量
  final int commentNum;

  /// 构造函数
  const SingleRightBar(
      {Key key, this.nickname, this.headerImage, this.commentNum})
      : super(key: key);

  /// 贴子栏中的用户头像和昵称信息
  Widget getUserWidget() {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            headerImage,
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 30)),
      ],
    );
  }

  /// 贴子栏中的评论信息
  Widget getCommentWidget() {
    return Column(
      children: <Widget>[
        Icon(Icons.comment, color: Colors.grey, size: 35),
        Padding(padding: EdgeInsets.only(top: 2)),
        Text(
          '$commentNum',
          style: TextStyles.commonStyle(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4)
        ),
        getUserWidget(),
        getCommentWidget()
      ],
    );
  }
}
