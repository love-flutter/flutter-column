import 'package:two_you_friend/util/struct/content_detail.dart';

/// api 拉取content list返回结构
///
/// {
///   "ret" : 0,
///   "message" : "success",
///   "hasMore" : true,
///   "lastId" : null,
/// }
class StructApiContentListRetInfo {
  /// 用户的昵称
  final int ret;

  /// 用户头像信息
  final String message;

  /// 是否还有更多
  final bool hasMore;

  /// 最后一个id
  final String lastId;

  /// 具体的content list
  final List<StructContentDetail> data;

  /// 构造函数
  const StructApiContentListRetInfo(
      this.ret, this.message, this.hasMore, this.lastId, this.data);
}
