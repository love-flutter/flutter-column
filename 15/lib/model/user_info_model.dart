import 'package:flutter/material.dart';

import 'package:two_you_friend/util/struct/user_info.dart';

/// name状态管理模块
class UserInfoModel with ChangeNotifier {
  /// 系统用户个人信息
  final StructUserInfo myUserInfo;

  /// 构造函数
  UserInfoModel({this.myUserInfo});

  /// 获取用户信息
  StructUserInfo get value => myUserInfo;
}
