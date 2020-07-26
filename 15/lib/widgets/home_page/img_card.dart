import 'dart:math';

import 'package:flutter/material.dart';

import 'package:two_you_friend/router.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';

/// 大小图卡片，注意这里必须是三分小图
class ImgCard extends StatelessWidget {
  /// 具体的位置
  final int position;

  /// 传入的贴子列表信息
  final List<StructContentDetail> articleInfoList;

  /// 是否为最后部分
  final bool isLast;

  /// 构造函数
  const ImgCard({Key key, this.articleInfoList, this.position, this.isLast})
      : super(key: key);

  /// 执行页面跳转到article_detail
  void goToArticleDetailPage(BuildContext context, String articleId) {
    Router().open(context, "tyfapp://contentpage?articleId=${articleId}");
  }

  @override
  Widget build(BuildContext context) {
    if (isLast) {
      return withSmallPic(context);
    }
    if ((position + 1) % 6 == 3) {
      return withBigPic(context);
    } else {
      return withSmallPic(context);
    }
  }

  /// 一大图二小图处理办法
  Widget withBigPic(BuildContext context) {
    if (Random().nextInt(2) == 1) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: getFlatImg(context, articleInfoList[0], 200),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                getFlatImg(context, articleInfoList[1]),
                Padding(padding: EdgeInsets.only(top: 2)),
                getFlatImg(context, articleInfoList[2]),
              ],
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                getFlatImg(context, articleInfoList[0]),
                Padding(padding: EdgeInsets.only(top: 2)),
                getFlatImg(context, articleInfoList[1]),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: getFlatImg(context, articleInfoList[2], 200),
          ),
        ],
      );
    }
  }

  /// 三小图，或者没有三个的图的处理
  Widget withSmallPic(BuildContext context) {
    List<Widget> rowList = [];
    for (var i = 0; i < 3; i++) {
      if (articleInfoList.length < i + 1) {
        rowList.add(Expanded(
          flex: 2,
          child: Row(),
        ));
        continue;
      }
      StructContentDetail articleInfo = articleInfoList[i];
      rowList.add(Expanded(flex: 2, child: getFlatImg(context, articleInfo)));
    }
    return Container(
      child: Row(
        children: rowList,
      ),
    );
  }

  /// 获取具体的图片组件
  Widget getFlatImg(BuildContext context, StructContentDetail articleInfo,
      [double size = 100]) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () => goToArticleDetailPage(context, articleInfo.id),
      child: Image.network(
        articleInfo.articleImage,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: size,
      ),
    );
  }
}
