import 'dart:math';

/// name 状态管理类
class NameStates {
  final String _name;
  /// getter 方法获取name
  get name => _name;

  /// 构造函数
  NameStates(this._name);

  /// 初始设置
  NameStates.initState() : _name = 'test flutter 1';

}

/// 定义 name state 对应的状态修改 action
///
/// [NameActions.changeName] 为修改当前 name
enum NameActions {
  /// 修改 name 的 state
  changeName
}

/// reducer 方法，触发组件更新
NameStates reducer(NameStates state, action){
  if (action == NameActions.changeName) {
    return changeName();
  }
  return state;
}

/// 修改当前name，随机选取一个
NameStates changeName() {
  List<String> nameList = ['flutter one', 'flutter two', 'flutter three'];
  int pos = Random().nextInt(3);
  return NameStates(nameList[pos]);
}