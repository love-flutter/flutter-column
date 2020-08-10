import 'package:flutter/material.dart';

import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/widgets/common/loading.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/home_page/img_card.dart';

/// 九宫格首页
class HomePageImgFlow extends StatefulWidget {
  /// 构造函数
  const HomePageImgFlow();

  @override
  createState() => HomePageImgFlowState();
}

/// 具体的state类
class HomePageImgFlowState extends State<HomePageImgFlow> {
  /// 首页推荐贴子列表
  List<StructContentDetail> contentList;

  @override
  void initState() {
    super.initState();
    // 拉取推荐内容
    ApiContentIndex.getRecommendList().then((retInfo) {
      setState(() {
        contentList = retInfo.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (contentList == null) {
      return Loading();
    }
    List<StructContentDetail> tmpList = [];

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: contentList.length + 1,
      itemBuilder: (BuildContext context, int position) {
        if (position % 3 == 0) {
          // 起始位置初始赋值
          tmpList = [this.contentList[position]];
        } else {
          // 非初始则插入列表
          tmpList.add(this.contentList[position]);
        }

        // 判断数据插入时机，如果最后一组或者满足三个一组则插入
        if (position == contentList.length - 1 || (position + 1) % 3 == 0) {
          return ImgCard(
              position: position,
              articleInfoList: tmpList,
              // 确认是否为最后数据，最后数据无需处理大小图问题
              isLast: position == contentList.length - 1);
        }

        return Container();
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: .1,
          //indent: 75,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }
}
