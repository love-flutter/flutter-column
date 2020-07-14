import 'package:flutter/material.dart';

import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/widgets/home_page/article_card.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';

/// 首页
class HomePageIndex extends StatefulWidget {
  /// 构造函数
  const HomePageIndex();

  @override
  createState() => HomePageIndexState();
}

/// 具体的state类
class HomePageIndexState extends State<HomePageIndex> {
  /// 首页推荐帖子列表
  List<StructContentDetail> contentList;

  @override
  void initState() {
    super.initState();
    // 拉取推荐内容
    setState(() {
      contentList = ApiContentIndex().getRecommendList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: contentList.length,
      itemBuilder: (BuildContext context, int position) {
        return ArticleCard(articleInfo: this.contentList[position]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: .5,
          //indent: 75,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }
}
