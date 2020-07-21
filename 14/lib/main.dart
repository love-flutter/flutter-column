import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:two_you_friend/router.dart';
import 'package:two_you_friend/api/user_info/index.dart';
import 'package:two_you_friend/api/user_info/message.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/model/new_message_model.dart';
import 'package:two_you_friend/model/user_info_model.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/widgets/common/error.dart';

// 底部导航栏
import 'package:two_you_friend/pages/entrance.dart';

/// APP 核心入口文件
void main() {
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  /// like num data
  final likeNumModel = LikeNumModel();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _getProviders(
      context,
      MaterialApp(
          title: 'Two You', // APP 名字
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue, // APP 主题
          ),
          routes: Router().registerRouter(),
          home: Entrance()),
    );
  }

  /// 部分数据需要获取初始值
  Widget _getProviders(BuildContext context, Widget child) {
    StructUserInfo myUserInfo = ApiUserInfoIndex.getSelfUserInfo();
    if (myUserInfo == null) {
      return CommonError();
    }
    int unReadMessageNum = ApiUserInfoMessage.getUnReadMessageNum();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LikeNumModel()),
        ChangeNotifierProvider(
            create: (context) => UserInfoModel(myUserInfo: myUserInfo)),
        ChangeNotifierProvider(
            create: (context) =>
                NewMessageModel(newMessageNum: unReadMessageNum)),
      ],
      child: child,
    );
  }
}
