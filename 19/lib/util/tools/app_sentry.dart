import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry/sentry.dart';

/// 判断当前环境类型
const bool inProduction = bool.fromEnvironment("dart.vm.product");

/// app错误上报服务
///
/// 上报客户端各类异常问题，并且防止出现 crash 问题
class AppSentry {
  /// catch 组件异常
  ///
  /// 开发模式下，本地打印，上线时则调用 sentry 平台
  static void runWithCatchError(Widget appMain) {
    // 捕获并上报 Flutter 异常
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (!inProduction) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack);
      }
    };
    runZonedGuarded<Future<Null>>(() async {
      await Sentry.init(
        (options) {
          options.dsn = 'https://f886adfd35e64062b01feb5e9a8723f6@o425523.ingest.sentry.io/5362342';
        },
      );
      runApp(appMain);
    }, (error, stackTrace) async {
      await _reportError(error, stackTrace);
    });
  }

  /// 上报异常的函数
  static Future<void> _reportError(dynamic error, dynamic stackTrace) async {
    if (!inProduction) {
      // 判断是否为正式环境
      print(stackTrace);
    }
    // sentry 上报
    final sentryId = await Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );

    print('Success! Event ID: ${sentryId}');
  }
}
