import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/tools/call_server.dart';

/// 搜索接口服务
class ApiSearchIndex {
  /// 根据内容id拉取内容详情
  static Future<Map<String, dynamic>> main([String keyword = '']) async {
    if (keyword == null) {
      return null;
    }
    Map<String, dynamic> retJson =
        await CallServer.get('search', {'keyword': keyword});
    StructApiRetInfo retInfo = StructApiRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return null;
    }
    List userList = retInfo.data['userList'] as List;
    List contentList = retInfo.data['contentList'] as List;

    return {'userList': userList, 'contentList': contentList};
  }

  /// 根据内容id拉取内容详情
  static Future<List<String>> suggest([String keyword = '']) async {
    Map<String, dynamic> retJson =
        await CallServer.get('searchSuggest', {'keyword': keyword});
    StructApiRetInfo retInfo = StructApiRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return [];
    }

    List<String> suggests = [];
    try {
      List sourceList = retInfo.data as List;
      sourceList.forEach((suggest) {
        suggests.add(suggest as String);
      });
    } catch (e) {
      return suggests;
    }
    return suggests;
  }
}
