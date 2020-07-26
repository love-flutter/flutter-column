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

  /// 将json数据转化为对象数据
  StructContentDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        summary = json['summary'] as String,
        detailInfo = json['detailInfo'] as String,
        uid = json['uid'] as String,
        userInfo = getUserInfo(json['userInfo'] as Map<String, dynamic>),
        articleImage = json['articleImage'] as String,
        likeNum = json['likeNum'] as int,
        commentNum = json['commentNum'] as int;

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructContentDetail contentDetail) => {
        "id": contentDetail.id,
        "title": contentDetail.title,
        "summary": contentDetail.summary,
        "detailInfo": contentDetail.detailInfo,
        "uid": contentDetail.uid,
        "userInfo": StructUserInfo.toJson(contentDetail.userInfo),
        "articleImage": contentDetail.articleImage,
        "likeNum": contentDetail.likeNum,
        "commentNum": contentDetail.commentNum
      };

  /// 判断用户信息是否存在，存在则处理
  static StructUserInfo getUserInfo(Map<String, dynamic> userInfo) {
    if (userInfo == null) {
      return null;
    }
    return StructUserInfo.fromJson(userInfo);
  }
}
