import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/tools/json_config.dart';

/// 统一调用API接口
class CallServer {
  /// get 方法
  static Future<Map<String, dynamic>> get(String apiName, [Map params]) async {
    // 根据类型，获取api具体信息
    Map<String, dynamic> apis = await JsonConfig.getConfig('api');
    if (apis == null) {
      return {"ret": false};
    }
    String callApi = apis[apiName]['apiUrl'] as String;

    // 处理异常情况
    if (callApi == null) {
      return {"ret": false};
    }
    // 处理参数替换
    if (params != null) {
      params.forEach((k, v) => callApi = callApi.replaceAll('{$k}', '$v'));
    }

    // 调用服务端接口获取返回数据
    try {
      Response response = await Dio(BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 9000,
      )).get(callApi, options: Options(responseType: ResponseType.json));
      Map<String, dynamic> retInfo =
          json.decode(response.toString()) as Map<String, dynamic>;
      return retInfo;
    } catch (e) {
      print(e);
      return {"ret": false};
    }
  }

  /// 获取列表接口
  static Future<StructApiListRetInfo> commonListApi(String apiName) async {
    Map<String, dynamic> retJson = await CallServer.get(apiName);
    if (retJson == null || retJson['ret'] == false) {
      return null;
    }
    StructApiListRetInfo retInfo = StructApiListRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return null;
    }
    try {
      return retInfo;
    } catch (e) {
      return null;
    }
  }

  /// 获取非列表接口
  static Future<StructApiRetInfo> commonApi(String apiName) async {
    Map<String, dynamic> retJson = await CallServer.get(apiName);
    if (retJson == null || retJson['ret'] == false) {
      return null;
    }
    StructApiRetInfo retInfo = StructApiRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return null;
    }
    try {
      return retInfo;
    } catch (e) {
      return null;
    }
  }
}
