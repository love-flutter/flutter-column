import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import 'package:two_you_friend/pages/search_page/custom_delegate.dart';
import 'package:two_you_friend/widgets/menu/draw.dart';
import 'package:two_you_friend/project_router.dart';

/// eum 类型
enum UniLinksType {
  /// string link
  string,
}

/// 项目页面入口文件
class Entrance extends StatefulWidget {
  /// 页面索引位置
  final int indexValue;

  /// 构造函数
  const Entrance({Key key, this.indexValue}) : super(key: key);

  @override
  _EntranceState createState() => _EntranceState();
}

/// entrance 状态类
///
/// 入口文件
class _EntranceState extends State<Entrance>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  UniLinksType _type = UniLinksType.string;
  StreamSubscription _sub;
  ProjectRouter router = ProjectRouter();

  @override
  void initState() {
    super.initState();
    //  scheme初始化，保证有上下文，需要跳转页面
    initPlatformState();
    _controller = TabController(vsync: this, length: 3);
    if (widget.indexValue != null) {
      _controller.animateTo(widget.indexValue);
    }
  }

  ///  初始化Scheme只使用了String类型的路由跳转
  ///  所以只有一个有需求可以使用[initPlatformStateForUriUniLinks]
  Future<void> initPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    }
  }

  /// 使用[String]链接实现
  Future<void> initPlatformStateForStringUniLinks() async {
    String initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      redirect(initialLink);
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
    }
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted || link == null) return;
      redirect(link);
    }, onError: (Object err) {
      if (!mounted) return;
    });
  }

  /// 跳转页面
  void redirect(String link) {
    if (link == null) {
      return;
    }
    int indexNum = router.open(context, link);
    if (indexNum > -1 && _controller.index != indexNum) {
      _controller.animateTo(indexNum);
    }
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
    if (_sub != null) _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two You'), // 页面名字
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: SearchPageCustomDelegate());
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_list),
              text: '推荐',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: '关注',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: '我',
            ),
          ],
        ),
      ),
      drawer: MenuDraw(redirect),
      body: TabBarView(
        controller: _controller,
        children: [
          router.getPageByRouter('homepage'),
          Icon(Icons.directions_transit),
          router.getPageByRouter('userpage')
        ],
      ),
    );
  }
}
