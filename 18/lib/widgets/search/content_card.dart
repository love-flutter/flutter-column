import 'package:flutter/material.dart';

import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/styles/text_syles.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';

/// 头部信息部分
class SearchContentCard extends StatelessWidget {
  /// 用户信息
  final StructContentDetail contentInfo;

  /// 构造函数
  const SearchContentCard({Key key, this.contentInfo});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(8),
      onPressed: () =>ProjectRouter()
          .open(context, "tyfapp://contentpage?articleId=${contentInfo.id}"),
      child: Row(
        children: <Widget>[
          Text(
            contentInfo.title,
            style: TextStyles.commonStyle(1),
          ),
        ],
      ),
    );
  }
}
