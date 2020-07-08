import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// 缓存配置信息，避免多次读取文件
const Map cache = {};

/// 获取 json 配置文件
///
/// 在使用该方法前，需要在 pubspec.yaml 中增加 assets 的配置引入
class JsonConfig {
  /// 读取 json 配置文件，并解析返回
  static Future getConfig(String fileName) async {
    if(cache[fileName] != null){
      return cache[fileName];
    }
    final jsonString = await rootBundle.loadString('assets/json/${fileName}.dart');
    try {
      var jsonRet = json.decode(jsonString);
      cache[fileName] = jsonRet;
      return jsonRet;
    } catch (err){
      // @todo add report log
      return false;
    }
  }

  /// object convert to map data
  static Map objectToMap(Object data) {
    return jsonDecode(JsonCodec().encode(data)) as Map;
  }
}
