import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/styles/text_syles.dart';

/// 贴子文章的赞组件
///
/// 包括点赞组件 icon ，以及组件点击效果
/// 需要外部参数[likeNum],点赞数量
/// [articleId] 贴子的内容
class SingleLikeBar extends StatelessWidget {
  /// 贴子id
  final String articleId;

  /// like num
  final int likeNum;

  /// 构造函数
  const SingleLikeBar({Key key, this.articleId, this.likeNum})
      : super(key: key);

  /// 返回组件信息
  @override
  Widget build(BuildContext context) {
    final likeNumModel = Provider.of<LikeNumModel>(context);

    return Container(
      width: 50,
      child: FlatButton(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Icon(Icons.thumb_up, color: Colors.grey, size: 36),
            Padding(padding: EdgeInsets.only(top: 2)),
            Text(
              '${likeNumModel.getLikeNum(articleId, likeNum)}',
              style: TextStyles.commonStyle(),
            ),
          ],
        ),
        onPressed: () => likeNumModel.like(articleId),
      ),
    );
  }
}
