import 'package:flutter/material.dart';

import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/util/tools/json_config.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/article_detail/comments.dart';
import 'package:two_you_friend/widgets/article_detail/content.dart';
import 'package:two_you_friend/widgets/article_detail/like.dart';
import 'package:two_you_friend/widgets/article_detail/img.dart';
import 'package:two_you_friend/widgets/article_detail/user_info_bar.dart';
import 'package:two_you_friend/widgets/common/error.dart';

/// 首页
class ArticleDetailIndex extends StatelessWidget {
  /// 贴子id
  final String articleId;

  /// 构造函数
  const ArticleDetailIndex({Key key, this.articleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = articleId;
    if (articleId == null &&
        ModalRoute.of(context).settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context).settings.arguments);
      id = dataInfo['articleId'].toString();
    }

    return FutureBuilder<Widget>(
        future: _getWidget(id),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.error != null) {
            return Container(
              child: CommonError(),
            );
          }
          return Container(
            child: snapshot.data,
          );
        });
  }

  Future<Widget> _getWidget(String id) async {
    StructContentDetail contentDetail = await ApiContentIndex.getOneById(id);
    if (contentDetail == null) {
      return CommonError();
    }
    return Scaffold(
      appBar: AppBar(title: Text(contentDetail.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ArticleDetailUserInfoBar(userInfo: contentDetail.userInfo),
            Padding(padding: EdgeInsets.only(top: 2)),
            ArticleDetailContent(content: contentDetail.detailInfo),
            ArticleDetailImg(articleImage: contentDetail.articleImage),
            ArticleDetailLike(articleId: id, likeNum: contentDetail.likeNum),
            ArticleDetailComments(commentList: [])
          ],
        ),
      ),
    );
  }
}
