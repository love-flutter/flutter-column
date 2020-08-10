import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/util/tools/call_server.dart';

/// 获取用户接口信息
class ApiUserInfoFollow {
  /// 根据用户id拉取用户信息
  static Future<StructApiListRetInfo> getFollowList([String lastId]) async {
    Map<String, dynamic> retJson = await CallServer.get('followFriendList');

    StructApiListRetInfo retInfo = StructApiListRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return retInfo;
    }
    if (retInfo.data['list'] == null) {
      return null;
    }
    List userInfoJsonList = [];
    try {
      userInfoJsonList = retJson['data']['list'] as List;
    } catch (e) {
      print(e);
      return null;
    }
    List<StructUserInfo> userInfoList = [];
    userInfoJsonList.forEach((userInfoJson) {
      userInfoList
          .add(StructUserInfo.fromJson(userInfoJson as Map<String, dynamic>));
    });

    retInfo.data['list'] = userInfoList;

    return retInfo;
  }
}
