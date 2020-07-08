import 'package:flutter_test/flutter_test.dart';

import 'package:two_you_friend/util/struct/user_info_struct.dart';

void main() {
  final UserInfoStruct userInfo = UserInfoStruct('test', 'http://test.com');

  test('test userinfo', () {
    expect(userInfo.nickname == 'test', true);
    expect(userInfo.headerImage, 'http://test.com',true);
  });

}
