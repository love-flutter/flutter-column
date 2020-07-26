import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:two_you_friend/router.dart';
import 'package:two_you_friend/api/user_info/index.dart';
import 'package:two_you_friend/api/user_info/message.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/model/new_message_model.dart';
import 'package:two_you_friend/model/user_info_model.dart';
import 'package:two_you_friend/pages/entrance.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/widgets/common/error.dart';

/// 处理pb测试
import 'package:two_you_friend/api_pb/user_info/index.dart';

/// 处理xml测试
import 'package:two_you_friend/api_xml/user_info/index.dart';

/// APP 核心入口文件
void main() {
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: _getProviders(
          context,
          MaterialApp(
              title: 'Two You', // APP 名字
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue, // APP 主题
              ),
              routes: Router().registerRouter(),
              home: Entrance()),
        ),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          return Container(
            child: snapshot.data,
          );
        });
  }

  /// 部分数据需要获取初始值
  Future<Widget> _getProviders(BuildContext context, Widget child) async {
    // json协议
    StructUserInfo myUserInfo = await ApiUserInfoIndex.getSelfUserInfo();
    //ApiPbUserInfoIndex.createUserInfo();
    // pb协议
    //StructUserInfo myUserInfo = await ApiPbUserInfoIndex.getSelfUserInfo();
    // xml协议
    //StructUserInfo myUserInfo = await ApiXmlUserInfoIndex.getSelfUserInfo();
    if (myUserInfo == null) {
      return MaterialApp(
          title: 'Two You', // APP 名字
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue, // APP 主题
          ),
          home: CommonError());
    }

    // 初始化共享状态对象
    LikeNumModel likeNumModel = LikeNumModel();
    NewMessageModel newMessageNum = NewMessageModel(newMessageNum: 0);
    // 异步数据处理
    ApiUserInfoMessage.getUnReadMessageNum(newMessageNum);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => likeNumModel),
        ChangeNotifierProvider(
            create: (context) => UserInfoModel(myUserInfo: myUserInfo)),
        ChangeNotifierProvider(create: (context) => newMessageNum),
      ],
      child: child,
    );
  }
}
