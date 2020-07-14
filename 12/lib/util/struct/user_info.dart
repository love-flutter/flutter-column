/// 用户信息
///
/// {
///   "nickname" : "string",
///   "headerUrl" : "string",
///   "uid" : "string"
/// }
class StructUserInfo {
  /// 标题
  final String nickName;

  /// 简要
  final String headerUrl;

  /// 主要内容
  final String uid;

  /// 默认构造函数
  const StructUserInfo(this.uid, this.nickName, this.headerUrl);
}
