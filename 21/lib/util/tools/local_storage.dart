import 'dart:async';
import 'dart:io';

import 'package:pedantic/pedantic.dart';
import 'package:path_provider/path_provider.dart';

/// 本地文件存储，可以存储系统设置相关的数据
class LocalStorage {
  /// 将数据保存到文件中
  static Future<void> save(String content, String filePath) async {
    final directory = await getApplicationDocumentsDirectory();

    try {
      File file = File('${directory.path}/$filePath');
      unawaited(file.writeAsString(content));
    } catch (e) {
      print(e);
    }
  }

  /// 获取文件数据内容
  static Future<String> get(String filePath) async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      File file = File('${directory.path}/$filePath');

      bool exist = await file.exists();

      if (!exist) {
        // 判断是否存在文件
        return '';
      }

      return file.readAsString();
    } catch (e) {
      return '';
    }
  }
}
