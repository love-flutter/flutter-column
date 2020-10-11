import 'package:flutter/material.dart';

import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/api/user_info/index.dart';
import 'package:two_you_friend/api/user_info/message.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/model/new_message_model.dart';
import 'package:two_you_friend/model/user_info_model.dart';
import 'package:two_you_friend/model/system_config_model.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/widgets/common/error.dart';

/// 处理所有 provider
class AppProvider {
  /// 部分数据需要获取初始值
  static Future<Widget> getProviders(BuildContext context, Widget child) async {
    // json协议
    StructUserInfo myUserInfo = await ApiUserInfoIndex.getSelfUserInfo();
    if (myUserInfo == null) {
      return MaterialApp(
          title: 'Two You', // APP 名字
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent, // APP 主题
          ),
          home: CommonError());
    }

    // 初始化共享状态对象
    LikeNumModel likeNumModel = LikeNumModel();
    NewMessageModel newMessageNum = NewMessageModel(newMessageNum: 0);
    // 异步数据处理
    unawaited(ApiUserInfoMessage.getUnReadMessageNum(newMessageNum));
    // 异步获取系统配置
    SystemConfigModel systemConfigModel = SystemConfigModel.init();

    /// The default constructor assumes that
    /// you have really created new object there
    /// so it will automatically call dispose on it later
    /// when ChangeNotifierProvider disappears.
    /// So it will dispose your page while it's still alive somewhere else
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LikeNumModel>.value(value: likeNumModel),
        ChangeNotifierProvider<UserInfoModel>.value(
            value: UserInfoModel(myUserInfo: myUserInfo)),
        ChangeNotifierProvider<NewMessageModel>.value(value: newMessageNum),
        ChangeNotifierProvider<SystemConfigModel>.value(
            value: systemConfigModel),
      ],
      child: child,
    );
  }
}
