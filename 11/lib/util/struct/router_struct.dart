import 'package:flutter/material.dart';

/// router 配置数据结构
class RouterStruct {
  /// 组件
  final Widget widget;

  /// 首页入口index
  final int entranceIndex;

  /// 组件参数列表
  final List<String> params;

  /// 默认构造函数
  const RouterStruct(this.widget, this.entranceIndex, this.params);
}
