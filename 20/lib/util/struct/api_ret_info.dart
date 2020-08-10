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

  /// 将json数据转化为对象数据
  StructApiContentListRetInfo.fromJson(Map<String, dynamic> json)
      : ret = json['ret'] as int,
        message = json['message'] as String,
        hasMore = json['hasMore'] as bool,
        lastId = json['lastId'] as String,
        data = getContentDetailList(json['data'] as List);

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructApiContentListRetInfo retInfo) => {
        'ret': retInfo.ret,
        'message': retInfo.message,
        'hasMore': retInfo.hasMore,
        'lastId': retInfo.lastId,
        'data': retInfo.data
            .map((contentInfo) => StructContentDetail.toJson(contentInfo))
      };

  /// 数据转化
  static List<StructContentDetail> getContentDetailList(List dataList) {
    List<StructContentDetail> retList = [];
    dataList.forEach((element) {
      Map<String, dynamic> contentDetail = element as Map<String, dynamic>;
      retList.add(StructContentDetail.fromJson(contentDetail));
    });
    return retList;
  }
}

/// 通用接口返回数据结构
class StructApiRetInfo {
  /// 用户的昵称
  final int ret;

  /// 用户头像信息
  final String message;

  /// 具体的data信息
  final data;

  /// 构造函数
  StructApiRetInfo.newMessage(this.ret, this.message, this.data);

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructApiRetInfo retInfo) =>
      {'ret': retInfo.ret, 'message': retInfo.message, 'data': retInfo.data};

  /// 将json数据转化为对象数据
  StructApiRetInfo.fromJson(Map<String, dynamic> json)
      : ret = json['ret'] as int,
        message = json['message'] as String,
        data = json['data'];
}

/// 通用列表数据结构
class StructApiListRetInfo {
  /// 用户的昵称
  final int ret;

  /// 用户头像信息
  final String message;

  /// 是否还有更多
  final bool hasMore;

  /// 最后一个id
  final String lastId;

  /// 具体的data信息
  final data;

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructApiListRetInfo retInfo) => {
        'ret': retInfo.ret,
        'message': retInfo.message,
        'hasMore': retInfo.hasMore,
        'lastId': retInfo.lastId,
        'data': retInfo.data
      };

  /// 将json数据转化为对象数据
  StructApiListRetInfo.fromJson(Map<String, dynamic> json)
      : ret = json['ret'] as int,
        message = json['message'] as String,
        hasMore = json['hasMore'] as bool,
        lastId = json['lastId'] as String,
        data = json['data'];
}
