import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/home_page.dart';

/// APP 核心入口文件
void main() => runApp(MyApp());

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Two You',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Two You'),
            ),
            body: Center(
              child: HomePage(),
            )));
  }
}