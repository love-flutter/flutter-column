/// 系统设置配置
///
/// {
///   "accessMessage" : "bool",
///   "tipsDetail" : "bool",
///   "soundReminder" : "bool",
/////   "vibrationReminder" : "bool"
/// }
class StructSystemConfig {
  /// 接收私信开关
  final bool accessMessage;

  /// 通知显示详情
  final bool tipsDetail;

  /// 声音
  final bool soundReminder;

  /// 振动
  final bool vibrationReminder;

  /// 默认构造函数
  const StructSystemConfig(this.accessMessage, this.tipsDetail,
      this.soundReminder, this.vibrationReminder);

  /// 将json数据转化为对象数据
  StructSystemConfig.fromJson(Map<String, dynamic> json)
      : accessMessage = json['accessMessage'] as bool,
        tipsDetail = json['tipsDetail'] as bool,
        soundReminder = json['soundReminder'] as bool,
        vibrationReminder = json['vibrationReminder'] as bool;

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructSystemConfig systemConfig) => {
        'accessMessage': systemConfig.accessMessage,
        'tipsDetail': systemConfig.tipsDetail,
        'soundReminder': systemConfig.soundReminder,
        'vibrationReminder': systemConfig.vibrationReminder
      };
}
