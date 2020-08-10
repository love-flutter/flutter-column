import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/system_config_model.dart';
import 'package:two_you_friend/styles/text_syles.dart';

/// 单个系统配置
///
/// [title]为贴子详情内容
class SystemPageSwitchCard extends StatelessWidget {
  /// 传入的贴子标题
  final String switchItem;

  /// 消息提醒文字
  final String itemDesc;

  /// 构造函数
  const SystemPageSwitchCard({Key key, this.itemDesc, this.switchItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取操作句柄
    final systemConfigModel = Provider.of<SystemConfigModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          itemDesc,
          style: TextStyles.commonStyle(1, Colors.black),
        ),
        Switch(
            // 选择
            value: systemConfigModel.getSwitchItem(switchItem),
            activeTrackColor: Colors.lightBlueAccent,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (newValue) {
              // 触发状态变化
              systemConfigModel.saveOne(
                  switchItem, !systemConfigModel.getSwitchItem(switchItem));
            }),
      ],
    );
  }
}
