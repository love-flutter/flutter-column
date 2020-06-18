import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two You', // app 的title信息 
      theme: ThemeData(
        primarySwatch: Colors.blue, // 页面的主题颜色
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Two You'), // 当前页面的 title 信息
          ),
          body:  Center(
            child: Text('Hello Flutter'), // 当前页面的显示的文本信息
          )
      )
    );
  }
}