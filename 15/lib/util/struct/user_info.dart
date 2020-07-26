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

  /// 将json数据转化为对象数据
  StructUserInfo.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] as String,
        headerUrl = json['headerUrl'] as String,
        nickName = json['nickName'] as String;

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructUserInfo userInfo) => {
        'uid': userInfo.uid,
        'headerUrl': userInfo.headerUrl,
        'nickName': userInfo.nickName
      };
}
