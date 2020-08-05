import 'package:flutter/material.dart';

import 'package:two_you_friend/styles/text_syles.dart';

/// 具体的贴子标题
///
/// [title]为贴子详情内容
class ArticleDetailTitle extends StatelessWidget {
  /// 传入的贴子标题
  final String title;

  /// 构造函数
  const ArticleDetailTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            this.title,
            softWrap: true,
            style: TextStyles.commonStyle(1.2),
          ),
        ));
  }
}
