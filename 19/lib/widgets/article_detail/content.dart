import 'package:flutter/material.dart';

import 'package:two_you_friend/styles/text_syles.dart';

/// 具体的贴子详情，内容模块
///
/// [content]为贴子详情内容
class ArticleDetailContent extends StatelessWidget {
  /// 传入的用户信息
  final String content;

  /// 构造函数
  const ArticleDetailContent({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.content,
      softWrap: true,
      style: TextStyles.commonStyle(1, Colors.black54),
    );
  }
}
