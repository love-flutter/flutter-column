import 'package:flutter/material.dart';

/// 具体的贴子图片
///
/// [title]为贴子详情内容
class ArticleDetailImg extends StatelessWidget {
  /// 传入的贴子标题
  final String articleImage;

  /// 构造函数
  const ArticleDetailImg({Key key, this.articleImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Image.network(
        articleImage,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
