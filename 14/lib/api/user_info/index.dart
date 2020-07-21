import 'package:two_you_friend/util/struct/user_info.dart';

/// 获取用户接口信息
class ApiUserInfoIndex {
  /// 根据用户id拉取用户信息
  static StructUserInfo getOneById(String id) {
    return StructUserInfo('1001', 'test 001',
        'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg');
  }

  /// 根据用户id拉取用户信息
  static StructUserInfo getSelfUserInfo() {
    return StructUserInfo('1001', 'test 001',
        'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg');
  }
}
