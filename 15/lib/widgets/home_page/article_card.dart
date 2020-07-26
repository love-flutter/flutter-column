import 'package:flutter/material.dart';

import 'package:two_you_friend/router.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/home_page/article_bottom_bar.dart';
import 'package:two_you_friend/widgets/home_page/article_like_bar.dart';
import 'package:two_you_friend/widgets/home_page/article_summary.dart';

/// 此为贴子描述类，包括了贴子UI中的所有元素
class ArticleCard extends StatelessWidget {
  /// 传入的贴子信息
  final StructContentDetail articleInfo;

  /// 构造函数
  const ArticleCard({Key key, this.articleInfo}) : super(key: key);

  /// 执行页面跳转到article_detail
  void goToArticleDetailPage(BuildContext context, String articleId) {
    Router().open(context, "tyfapp://contentpage?articleId=${articleId}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: FlatButton(
        onPressed: () => goToArticleDetailPage(context, articleInfo.id),
        child: Column(
          children: <Widget>[
            ArticleSummary(
                title: articleInfo.title,
                summary: articleInfo.summary,
                articleImage: articleInfo.articleImage),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: ArticleBottomBar(
                      nickname: articleInfo.userInfo.nickName,
                      headerImage: articleInfo.userInfo.headerUrl,
                      commentNum: articleInfo.commentNum),
                ),
                Expanded(
                  flex: 3,
                  child: ArticleLikeBar(
                      articleId: articleInfo.id, likeNum: articleInfo.likeNum),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
