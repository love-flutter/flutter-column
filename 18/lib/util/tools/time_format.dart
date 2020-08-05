import 'package:intl/intl.dart';

/// 时间戳处理
class TimeFormat {
  /// 将时间戳转化为字符串
  static String tsToTimeString(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('MM月d日 HH:mm');
    var formatYesterday = DateFormat('HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inDays == 0 && diff.inHours == 0 && diff.inMinutes == 0) {
      time = diff.inSeconds.toString() + '秒前';
    } else if (diff.inDays == 0 && diff.inHours == 0) {
      time = diff.inMinutes.toString() + '分钟前';
    } else if (diff.inDays == 0 && diff.inHours > 0) {
      time = diff.inMinutes.toString() + '小时前';
    } else if (diff.inDays < 2 && diff.inDays > 0) {
      time = '昨天 ' + formatYesterday.format(date);
    } else if (diff.inDays < 5 && diff.inDays > 0) {
      time = diff.inDays.toString() + '天前';
    } else {
      time = format.format(date);
    }
    return time;
  }
}
