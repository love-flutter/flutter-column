import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/util/tools/call_server.dart';

/// 获取内容详情接口
class ApiContentIndex {
  /// 根据内容id拉取内容详情
  StructContentDetail getOneById(String id) {}

  /// 拉取用户内容推荐贴子列表
  Future<StructApiContentListRetInfo> getRecommendList([lastId = null]) async {
    if (lastId != null) {
      Map<String, dynamic> retJson =
          await CallServer.get('recommendListNext', {lastId: lastId});

      return StructApiContentListRetInfo.fromJson(retJson);
    } else {
      Map<String, dynamic> retJson = await CallServer.get('recommendList');
      return StructApiContentListRetInfo.fromJson(retJson);
    }
  }

  /// 拉取用户关注的贴子列表
  Future<StructApiContentListRetInfo> getFollowList([lastId = null]) async {
    if (lastId != null) {
      Map<String, dynamic> retJson =
          await CallServer.get('followList', {lastId: lastId});

      return StructApiContentListRetInfo.fromJson(retJson);
    } else {
      Map<String, dynamic> retJson = await CallServer.get('followListNext');
      return StructApiContentListRetInfo.fromJson(retJson);
    }
  }
}
