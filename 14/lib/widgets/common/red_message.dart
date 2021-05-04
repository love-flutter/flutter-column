import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

/// 通用红点逻辑
class CommonRedMessage {
  /// 只展示红点，不展示具体消息数
  static Widget showRedWidget(Widget needRedWidget, int newMessageNum) {
    if (newMessageNum < 1) {
      // 小于1的消息则无需设置
      return needRedWidget;
    }
    return _getBadge(needRedWidget, '');
  }

  /// 展示消息提醒
  static Widget showRedNumWidget(Widget needRedWidget, int newMessageNum) {
    if (newMessageNum < 1) {
      // 小于1的消息则无需设置
      return needRedWidget;
    }
    // 消息数大于99时，则只显示一个红点即可
    String msgTips = newMessageNum > 99 ? '99+' : '$newMessageNum';
    return _getBadge(needRedWidget, msgTips);
  }

  /// 获取badge组件
  static Widget _getBadge(Widget needRedWidget, String msgTips) {
    return Badge(
      alignment: Alignment.bottomLeft,
      position: BadgePosition.topEnd(),
      toAnimate: false,
      badgeContent: Text(
        '$msgTips',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.0,
          letterSpacing: 1,
          wordSpacing: 2,
          height: 1,
        ),
      ),
      child: needRedWidget,
    );
  }
}
