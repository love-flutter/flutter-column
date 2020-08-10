import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/styles/text_syles.dart';

/// 贴子文章的赞组件
///
/// 包括点赞组件 icon ，以及组件点击效果
/// 需要外部参数[likeNum],点赞数量
class ArticleLikeBar extends StatelessWidget {
  /// 贴子id
  final String articleId;

  /// like num
  final int likeNum;

  /// 构造函数
  const ArticleLikeBar({Key key, this.articleId, this.likeNum})
      : super(key: key);

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    final likeNumModel = Provider.of<LikeNumModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.thumb_up, color: Colors.grey, size: 18),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                '${likeNumModel.getLikeNum(articleId, likeNum)}',
                style: TextStyles.commonStyle(0.8),
              ),
            ],
          ),
          onPressed: () => likeNumModel.like(articleId),
        ),
      ],
    );
  }
}
