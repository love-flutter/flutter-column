import 'package:two_you_friend/util/struct/user_info.dart';

/// 用户信息
///
/// {
///   "userInfo" : "StructUserInfo",
///   "comment" : "string"
/// }
class StructCommentInfo {
  /// 用户的昵称
  final StructUserInfo userInfo;

  /// 用户头像信息
  final String comment;

  /// 构造函数
  const StructCommentInfo(this.userInfo, this.comment);

  /// 将json数据转化为对象数据
  StructCommentInfo.fromJson(Map<String, dynamic> json)
      : comment = json['comment'] as String,
        userInfo =
            StructUserInfo.fromJson(json['userInfo'] as Map<String, dynamic>);

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructCommentInfo commentInfo) => {
        'comment': commentInfo.comment,
        'userInfo': StructUserInfo.toJson(commentInfo.userInfo)
      };
}
