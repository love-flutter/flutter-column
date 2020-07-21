import 'package:flutter/material.dart';

import 'package:two_you_friend/styles/text_syles.dart';

/// 贴子概要信息
///
/// 包括贴子的标题，贴子描述和贴子中的图片
class ArticleSummary extends StatelessWidget {
  /// 贴子标题
  final String title;

  /// 贴子概要描述信息
  final String summary;

  /// 贴子中的图片信息
  final String articleImage;

  /// 构造函数
  const ArticleSummary({Key key, this.title, this.summary, this.articleImage})
      : super(key: key);

  /// 左侧的标题和标题描述组件
  Widget getLeftInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyles.commonStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          summary,
          style: TextStyles.commonStyle(0.8, Colors.grey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: getLeftInfo(),
        ),
        Expanded(
          flex: 2,
          child: Image.network(
            articleImage,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
