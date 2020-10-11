import 'package:flutter/material.dart';

import 'package:two_you_friend/widgets/system_page/switch_card.dart';

/// 首页
class SystemConfigPageIndex extends StatelessWidget {
  /// 构造函数
  const SystemConfigPageIndex();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          SystemPageSwitchCard(itemDesc: '新消息提醒', switchItem: 'accessMessage'),
          SystemPageSwitchCard(itemDesc: '通知显示详情', switchItem: 'tipsDetail'),
          SystemPageSwitchCard(itemDesc: '声音', switchItem: 'soundReminder'),
          SystemPageSwitchCard(itemDesc: '振动', switchItem: 'vibrationReminder')
        ],
      ),
    );
  }
}
