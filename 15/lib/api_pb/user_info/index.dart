import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/util/tools/call_server.dart';

import 'package:two_you_friend/protos/user_info.pb.dart';

/// 获取用户接口信息
class ApiPbUserInfoIndex {
  /// 获取自己的个人信息
  static Future<StructUserInfo> getSelfUserInfo() async {
    // 该数据涞源createUserInfo函数
    int currentTime = DateTime.now().microsecondsSinceEpoch;
    UserInfoRsp userInfoRsp = UserInfoRsp.fromBuffer([
      10,
      4,
      116,
      101,
      115,
      116,
      18,
      72,
      104,
      116,
      116,
      112,
      58,
      47,
      47,
      105,
      109,
      97,
      103,
      101,
      46,
      98,
      105,
      97,
      111,
      98,
      97,
      105,
      106,
      117,
      46,
      99,
      111,
      109,
      47,
      117,
      112,
      108,
      111,
      97,
      100,
      115,
      47,
      50,
      48,
      49,
      56,
      48,
      50,
      49,
      49,
      47,
      48,
      48,
      47,
      49,
      53,
      49,
      56,
      50,
      55,
      57,
      57,
      54,
      55,
      45,
      73,
      65,
      110,
      86,
      121,
      80,
      105,
      82,
      76,
      75,
      46,
      106,
      112,
      103,
      26,
      4,
      51,
      48,
      48,
      49
    ]);
    print('pb length');
    print(userInfoRsp.toString().length);

    int dfTime = DateTime.now().microsecondsSinceEpoch - currentTime;
    print('pb decode time');
    print(dfTime);

    return StructUserInfo(
        userInfoRsp.uid, userInfoRsp.nickName, userInfoRsp.headerUrl);
  }

  /// 生成二进制内容，测试文件
  static List<int> createUserInfo() {
    UserInfoRsp userInfoRsp = UserInfoRsp();
    userInfoRsp.nickName = 'test';
    userInfoRsp.uid = '3001';
    userInfoRsp.headerUrl =
        'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg';
    List<int> retInfo = userInfoRsp.writeToBuffer();

    print(retInfo);

    return retInfo;
  }
}
