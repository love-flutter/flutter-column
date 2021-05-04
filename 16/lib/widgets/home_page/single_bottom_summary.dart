import 'package:flutter/material.dart';

import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/styles/text_syles.dart';

/// 贴子概要信息
///
/// 包括贴子的标题，贴子描述和贴子中的图片
class SingleBottomSummary extends StatelessWidget {
  ///贴子 id
  final String articleId;

  /// 贴子标题
  final String title;

  /// 贴子概要描述信息
  final String summary;

  /// 构造函数
  const SingleBottomSummary({Key key, this.articleId, this.title, this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/8)
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () =>ProjectRouter()
                .open(context, "tyfapp://contentpage?articleId=${articleId}"),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyles.commonStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  summary,
                  style: TextStyles.commonStyle(0.8, Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
