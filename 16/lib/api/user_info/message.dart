import 'package:two_you_friend/model/new_message_model.dart';
import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/tools/call_server.dart';

/// 获取用户消息相关
class ApiUserInfoMessage {
  /// 获取自己的个人信息
  static Future<void> getUnReadMessageNum(
      NewMessageModel newMessageModel) async {
    Map<String, dynamic> retJson = await CallServer.get('newMessage');
    if(retJson == null || retJson['ret'] == false){
      return;
    }
    StructApiRetInfo retInfo = StructApiRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return;
    }
    Map dataInfo = retInfo.data as Map;

    if (dataInfo == null || dataInfo['unread_num'] == null) {
      return;
    }
    newMessageModel.setNewMessageNum(dataInfo['unread_num'] as int);
  }
}
