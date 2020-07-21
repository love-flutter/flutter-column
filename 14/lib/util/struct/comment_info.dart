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
}
