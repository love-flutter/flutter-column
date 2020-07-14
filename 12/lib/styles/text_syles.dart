import 'package:flutter/material.dart';

/// 文本样式相关的类
///
/// 获取文本样式内容，各类文本相关的都会包含在此，目的是后续修改字体，修改默认字体大小，可以统一
class TextStyles {
  /// 默认字体大小
  static double baseFontSize = 18.0;

  /// 主页内容的bottom bar下的样式
  static TextStyle commonStyle(
      [double multipleFontSize = 1, Color myColor = Colors.lightBlueAccent]) {
    return TextStyle(
        color: myColor,
        fontSize: baseFontSize * multipleFontSize,
        letterSpacing: 1,
        wordSpacing: 2,
        height: 1.2);
  }
}
