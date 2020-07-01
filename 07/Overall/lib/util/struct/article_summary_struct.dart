/// 描述帖子的数据结构
class ArticleSummaryStruct {
  /// 帖子标题
  final String title;

  /// 帖子概要
  final String summary;

  /// 帖子一张图
  final String articleImage;

  /// 点赞数量
  final int likeNum;

  /// 评论数量
  final int commentNum;

  /// 帖子内容
  final String content;

  /// 构造函数
  const ArticleSummaryStruct(this.title, this.summary, this.articleImage,
      this.likeNum, this.commentNum,
      [this.content]);
}
