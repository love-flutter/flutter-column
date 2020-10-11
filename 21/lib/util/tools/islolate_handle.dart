import 'dart:collection';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';


import 'package:package_info/package_info.dart';
import 'package:device_info/device_info.dart';
/// 保存当前 isolate 连接
Isolate isolate;
/// 报错连接句柄
var sendPort;

/// 线程处理模块
///
/// 新线程处理性能上报和分析
class IsolateHandle {
  /// 计算并上报fps
  static calculateFps(
      ListQueue<FrameTiming> routerFrames, String routerName, String deviceInfo
      ) {
    sendMsg('calculateFps', routerFrames, routerName, deviceInfo);
  }

  /// 发送消息给到 isolate
  static sendMsg(
      String callFun, ListQueue<FrameTiming> routerFrames,
      String deviceInfo, String routerName
      ) async {
    var receivePort = ReceivePort();

    if(isolate == null ) {
      isolate = await Isolate.spawn(otherIsolate, receivePort.sendPort);
    }
    Map dataInfo = {
      'fun' : callFun,
      'routerFrames' : routerFrames,
      'deviceInfo' : deviceInfo,
      'routerName' : routerName
    };
    if(sendPort != null){ // 如果已经连接成功，则直接使用 sendPort 发送消息
      sendPort.send(dataInfo);
    }
    receivePort.listen((data) {
      if (data is SendPort) { // 创建初始连接
        sendPort = data;
        return;
      }
      sendPort.send(dataInfo);
    });
  }

  /// 其他线程，处理计算和上报
  static void otherIsolate(SendPort sendPort) {
    var receivePort = ReceivePort();
    receivePort.listen((data) {
      if(data['fun'] == 'calculateFps') {
        isolateCalculateFps(
            data['routerFrames'] as ListQueue<FrameTiming>,
            data['routerName'] as String,
            data['deviceInfo'] as String
        );
      }
      if(data['fun'] == 'reportPv') {
        isolateReportPv(
            data['routerName'] as String,
            data['deviceInfo'] as String
        );
      }
    });
    // 首先需要回句柄，创建通信连接
    sendPort.send(receivePort.sendPort);
    // 再发送回包，处理具体的信息
    sendPort.send('success');
  }

  /// 这里上报 pv 数据
  static void isolateReportPv(String routerName, String deviceInfo) async {
    print('${deviceInfo}\t${routerName}');
    /// @todo report to server
  }

  /// 计算当个页面的 fps
  static void isolateCalculateFps(
      ListQueue<FrameTiming> calculateList,
      String routerName,
      String deviceInfo
      ) {
    if(calculateList == null){
      return;
    }
    String fpsStr = 60.toStringAsFixed(3);
    int lostNum = 0;
    // flutter 标准渲染频率
    double standardFps = 1000/60;
    // 计算多少出现掉帧情况，请注意如果是 33秒，其掉帧为2，用34/16。67下取整。
    calculateList.forEach((frame) {
      if(frame.totalSpan.inMilliseconds > standardFps) { // 超出 16ms 的帧
        lostNum = lostNum + (
            frame.totalSpan.inMilliseconds/standardFps
        ).floor();
      }
    });
    if(calculateList.length + lostNum > 0) { // 尽量避免分母为0情况
      double fps = ( 60 * calculateList.length ) /
          ( calculateList.length + lostNum );
      fpsStr = fps.toStringAsFixed(3);
    }
    print('${deviceInfo}\t${fpsStr}');
  }

  /// 获取设备信息
  static Future<String> getDeviceInfo() async {
    String deviceName = '';
    /// 获取设备插件句柄
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isAndroid) { // 判断平台
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) { // 判断平台
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.utsname.machine;
    }
    // 获取当前客户端版本信息
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return '${deviceName}\t${version}';
  }
}