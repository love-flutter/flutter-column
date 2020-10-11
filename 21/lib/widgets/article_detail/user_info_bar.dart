import 'package:flutter/material.dart';

import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/styles/text_syles.dart';
import 'package:two_you_friend/util/struct/user_info.dart';

/// 具体的贴子标题
///
/// [title]为贴子详情内容
class ArticleDetailUserInfoBar extends StatelessWidget {
  /// 传入的贴子标题
  final StructUserInfo userInfo;

  /// 构造函数
  const ArticleDetailUserInfoBar({Key key, this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () => ProjectRouter().open(
                  context, "tyfapp://userpageguest?userId=${userInfo.uid}"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      userInfo.headerUrl,
                      width: 28.0,
                      height: 28.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(userInfo.nickName,
                      style: TextStyles.commonStyle(0.8, Colors.grey)),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.trending_up,
                    color: Colors.grey,
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    '123',
                    style: TextStyles.commonStyle(0.8, Colors.grey),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
