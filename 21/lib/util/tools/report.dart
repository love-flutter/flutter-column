import 'dart:collection';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:two_you_friend/util/tools/islolate_handle.dart';

/// 设备信息
String deviceInfo;

/// 报错的当前所有帧信息
ListQueue<FrameTiming> frames = ListQueue<FrameTiming>(100);

/// 当前路由的帧信息
ListQueue<FrameTiming> routerFrames = ListQueue<FrameTiming>();

/// 数据上报累
///
/// 处理各类 pv 和异常上报
class Report {
  /// 启动监听数据
  static void start() async{
    deviceInfo = await IsolateHandle.getDeviceInfo();
    SchedulerBinding.instance.addTimingsCallback(
        Report.onReportTimings
    );
  }

  /// 数据处理
  static void onReportTimings(List<FrameTiming> timings) {
    for (FrameTiming timing in timings) {
      frames.addFirst(timing);
      routerFrames.addFirst(timing);
    }
  }

  /// 开始计算页面的fps
  static void startRecord(String routerName) {
    routerFrames.clear();
  }

  /// 结束并显示数据
  static void endRecord(String routerName) {
    IsolateHandle.calculateFps(routerFrames, routerName, deviceInfo);
    routerFrames.clear();
  }
}