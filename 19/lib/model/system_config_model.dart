import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:two_you_friend/util/tools/local_storage.dart';
import 'package:two_you_friend/util/struct/system_config.dart';

/// 系统设置状态变量
class SystemConfigModel with ChangeNotifier {
  /// 状态变量文件内容
  StructSystemConfig systemConfig;

  /// 构造函数
  SystemConfigModel.init() {
    LocalStorage.get('tyfapp.system.config').then((configStr) {
      Map<String, dynamic> configInfo = {};
      if (configStr == null || configStr == '') {
        // 判断合法性
        configInfo = {
          "accessMessage": true,
          "tipsDetail": true,
          "soundReminder": true,
          "vibrationReminder": true
        };
      } else {
        try {
          // 尝试 json 解析，解析失败直接返回
          configInfo = json.decode(configStr) as Map<String, dynamic>;
        } catch (e) {
          return;
        }
      }
      systemConfig = StructSystemConfig.fromJson(configInfo);
    });
  }

  /// 转化为StructSystemConfig结构
  StructSystemConfig get() {
    return systemConfig;
  }

  /// 转化为StructSystemConfig结构
  bool getSwitchItem(String switchItem) {
    if (systemConfig == null) {
      return false;
    }
    Map<String, dynamic> systemConfigJson =
        StructSystemConfig.toJson(systemConfig);

    try {
      return systemConfigJson[switchItem] as bool;
    } catch (e) {
      return false;
    }
  }

  /// 保存单个数据
  void saveOne(String key, bool value) {
    Map<String, dynamic> systemConfigJson =
        StructSystemConfig.toJson(systemConfig);
    if (systemConfigJson[key] == value) {
      return;
    }
    systemConfigJson[key] = value;
    systemConfig = StructSystemConfig.fromJson(systemConfigJson);
    LocalStorage.save(json.encode(systemConfigJson), 'tyfapp.system.config');
    notifyListeners();
  }

  /// 整体数据保存
  void save(StructSystemConfig newSystemConfig) {
    if (systemConfig.accessMessage == newSystemConfig.accessMessage &&
        systemConfig.tipsDetail == newSystemConfig.tipsDetail &&
        systemConfig.soundReminder == newSystemConfig.soundReminder &&
        systemConfig.vibrationReminder == newSystemConfig.vibrationReminder) {
      return;
    }
    systemConfig = newSystemConfig;
    LocalStorage.save(json.encode(StructSystemConfig.toJson(systemConfig)),
        'tyfapp.system.config');
    notifyListeners();
  }
}
