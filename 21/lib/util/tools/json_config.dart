import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// 缓存配置信息，避免多次读取文件
const Map<String, Map<String, dynamic>> cache = {};

/// 获取 json 配置文件
///
/// 在使用该方法前，需要在 pubspec.yaml 中增加 assets 的配置引入
class JsonConfig {
  /// 读取 json 配置文件，并解析返回
  static Future<Map<String, dynamic>> getConfig(String fileName) async {
    final jsonString =
        await rootBundle.loadString('assets/json/${fileName}.json');
    try {
      Map<String, dynamic> jsonRet =
          json.decode(jsonString) as Map<String, dynamic>;
      return jsonRet;
    } catch (err) {
      print(err);
      return null;
    }
  }

  /// object convert to map data
  static Map objectToMap(Object data) {
    return jsonDecode(JsonCodec().encode(data)) as Map;
  }
}
