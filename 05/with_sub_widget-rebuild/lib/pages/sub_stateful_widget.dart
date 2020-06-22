import 'package:flutter/material.dart';

/// 创建子组件类
class SubStatefulWidget extends StatefulWidget {
  @override
  createState() {
    print('sub create state');
    return SubState();
  }
}

/// 创建子组件状态管理类
class SubState extends State<SubStatefulWidget> {
  String name = 'sub test';

  @override
  initState() {
    print('sub init state');
    super.initState();
  }

  @override
  didChangeDependencies() {
    print('sub did change dependencies');
    super.didChangeDependencies();
  }

  @override
  didUpdateWidget(SubStatefulWidget oldWidget) {
    print('sub did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  deactivate() {
    print('sub deactivate');
    super.deactivate();
  }

  @override
  dispose() {
    print('sub dispose');
    super.dispose();
  }

  @override
  reassemble() {
    print('sub reassemble');
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    print('sub build');
    return Text('subname $name'); // 使用Text组件显示当前name state
  }
}
