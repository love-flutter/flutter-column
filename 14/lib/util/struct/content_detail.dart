import 'package:two_you_friend/util/struct/user_info.dart';

/// router 配置数据结构
///
/// {
///   "id" : "string",
///   "title" : "string",
///   "summary" : "string",
///   "detailInfo" : "string",
///   "uid" : "string",
///   "userInfo" : "StructUserInfo",
///   "articleImage" : "string",
///   "likeNum" : "int",
///   "commentNum" : "int"
/// }
class StructContentDetail {
  /// 贴子id
  final String id;

  /// 标题
  final String title;

  /// 简要
  final String summary;

  /// 主要内容
  final String detailInfo;

  /// 作者ID
  final String uid;

  /// 用户信息
  final StructUserInfo userInfo;

  /// 文章图片标识
  final String articleImage;

  /// 点赞数
  final int likeNum;

  /// 评论数量
  final int commentNum;

  /// 默认构造函数
  const StructContentDetail(this.id, this.title, this.summary, this.detailInfo,
      this.uid, this.likeNum, this.commentNum, this.articleImage,
      {this.userInfo});
}
