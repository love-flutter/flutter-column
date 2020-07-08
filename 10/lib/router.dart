import 'package:flutter/material.dart';

import 'package:two_you_friend/pages/common/web_view_page.dart';
import 'package:two_you_friend/pages/home_page/index.dart';
import 'package:two_you_friend/pages/user_page/index.dart';

/// app 协议头
const String appScheme = "tyfapp";

/// action mapping
const Map<String, List<String>> paramsMapping = {
  'homepage' : null,
  'userpage' : ['userId']
};

/// 处理APP内的跳转
class Router {
  /// 根据url处理获得需要跳转的action页面以及需要携带的参数
  Widget _getPage(String url, Map<String, dynamic> urlParseRet) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return CommonWebViewPage(url: url);
    } else if(url.startsWith(appScheme)) {
      // 判断是否解析出 path action，并且能否在路由配置中找到
      String pathAction = urlParseRet['action'].toString();
      switch (pathAction) {
        case "homepage": {
          return _buildPage(HomePageIndex());
        }
        case "userpage": {
          // 必要性检查，如果没有参数则不做任何处理
          if(urlParseRet['params']['user_id'].toString() == null) {
            return null;
          }
          return _buildPage(
              UserPageIndex(
                  userId: urlParseRet['params']['user_id'].toString()
              )
          );
        }
        default: {
          return _buildPage(HomePageIndex());
        }
      }
    }
    return null;
  }

  /// 执行页面跳转
  void push(BuildContext context, String url) {
    Map<String, dynamic> urlParseRet = _parseUrl(url);

    Navigator.pushNamedAndRemoveUntil(
        context,
        urlParseRet['action'].toString(), (route) {
              if(route.settings.name ==
                  urlParseRet['action'].toString()) {
                return false;
              }
              return true;
            }, arguments: urlParseRet['params']);
  }

  /// 解析跳转的url，并且分析其内部参数
  Map<String, dynamic> _parseUrl(String url) {
    if(url.startsWith(appScheme)) {
      url = url.substring(9);
    }

    int placeIndex = url.indexOf('?');

    if(url == '' || url == null) {
      return {'action': '/', 'params': null};
    }
    if (placeIndex < 0) {
      return {'action': url, 'params': null};
    }

    String action = url.substring(0, placeIndex);
    String paramStr = url.substring(placeIndex + 1);

    if (paramStr == null) {
      return {'action': action, 'params': null};
    }

    Map params = {};
    List<String> paramsStrArr = paramStr.split('&');
    for (String singleParamsStr in paramsStrArr) {
      List<String> singleParamsArr = singleParamsStr.split('=');
      if(paramsMapping[action].indexOf(singleParamsArr[0]) > -1) {
        params[singleParamsArr[0]] = singleParamsArr[1];
      }
    }
    return {'action': action, 'params': params};
  }

  /// 增加 scaffold
  Widget _buildPage(Widget widgetPage) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Two You'), // 页面名字
        ),
        body: Center(
          child: widgetPage,
        )
    );
  }

  /// 注册路由事件
  Map<String, Widget Function(BuildContext)> registerRouter () {
    return {
      'homepage' : (context) => _buildPage(HomePageIndex()),
      'userpage' : (context) => _buildPage(UserPageIndex())
    };
  }

//  /// 设置路由跳转逻辑
//  MaterialPageRoute generateRoute(String pathAction, Object params) {
//    Map paramsMap = {};
//    if(params != null) {
//      paramsMap = jsonDecode(JsonCodec().encode(params)) as Map;
//    }
//    switch (pathAction) {
//      case 'userpage' : {
//        return MaterialPageRoute(
//            builder: (context) => _buildPage(
//                UserPageIndex(
//                    userId: paramsMap['userId'].toString()
//                )
//            )
//        );
//      }
//      case 'homepage' : {
//        return MaterialPageRoute(
//            builder: (context) => _buildPage(HomePageIndex())
//        );
//      }
//      default: {
//        return MaterialPageRoute(
//            builder: (context) => _buildPage(HomePageIndex())
//        );
//      }
//    }
//  }
}