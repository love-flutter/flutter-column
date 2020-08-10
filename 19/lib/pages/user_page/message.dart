import 'package:flutter/material.dart';

import 'package:two_you_friend/api/user_info/message.dart';
import 'package:two_you_friend/widgets/common/error.dart';
import 'package:two_you_friend/widgets/common/loading.dart';
import 'package:two_you_friend/widgets/user_page/message_card.dart';
import 'package:two_you_friend/util/struct/message.dart';

/// 我的私信消息列表
class UserPageMessage extends StatefulWidget {
  /// 构造函数
  const UserPageMessage();

  @override
  createState() => UserPageMessageState();
}

/// 具体的state类
class UserPageMessageState extends State<UserPageMessage> {
  /// 首页推荐贴子列表
  List<StructUserMessage> contentList;

  /// 列表事件监听
  ScrollController scrollController = ScrollController();

  /// 是否存在下一页
  bool hasMore;

  /// 页面是否正在加载
  bool isLoading;

  /// 最后一个数据 id
  String lastId;

  /// 是否接口报错
  bool error = false;

  /// 是否有未读评论消息数
  int unReadCommentNum = 0;

  @override
  void initState() {
    super.initState();

    /// 拉取首页接口数据
    setFirstPage();

    /// 监听上滑事件，活动加载更多
    this.scrollController.addListener(() {
      if (!hasMore) {
        return;
      }
      if (!isLoading &&
          scrollController.position.pixels >=
              scrollController.position.maxScrollExtent) {
        isLoading = true;
        loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  /// 加载下一页
  void loadMoreData() {
    ApiUserInfoMessage.getMessageList(lastId).then((retInfo) {
      if (retInfo.ret != 0) {
        return;
      }
      List messageList = retInfo.data['noticeMessage'] as List;

      if (messageList == null || messageList.isEmpty) {
        return;
      }

      List<StructUserMessage> newList = [];

      messageList.forEach((messageInfo) {
        newList.add(
            StructUserMessage.fromJson(messageInfo as Map<String, dynamic>));
      });

      setState(() {
        error = false;
        isLoading = false;
        hasMore = retInfo.hasMore;
        unReadCommentNum = retInfo.data['commentNewMessage'] as int;
        contentList.addAll(newList);
      });
    });
  }

  /// 处理刷新操作
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      setFirstPage();
    });
  }

  /// 处理首次拉取和刷新数据获取动作
  void setFirstPage() {
    ApiUserInfoMessage.getMessageList().then((retInfo) {
      if (retInfo.ret != 0) {
        // 判断返回是否正确
        error = true;
        return;
      }

      List messageList = retInfo.data['noticeMessage'] as List;

      if (messageList == null || messageList.isEmpty) {
        return;
      }

      List<StructUserMessage> newList = [];

      messageList.forEach((messageInfo) {
        newList.add(
            StructUserMessage.fromJson(messageInfo as Map<String, dynamic>));
      });

      setState(() {
        error = false;
        contentList = newList;
        hasMore = retInfo.hasMore;
        isLoading = false;
        unReadCommentNum = retInfo.data['commentNewMessage'] as int;
        lastId = retInfo.lastId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (error) {
      return CommonError(action: this.setFirstPage);
    }
    if (contentList == null) {
      return Loading();
    }
    return RefreshIndicator(
      onRefresh: onRefresh, // 调用刷新事件
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        shrinkWrap: true,
        itemCount: contentList.length + 1,
        itemBuilder: (BuildContext context, int position) {
          if (position < this.contentList.length) {
            return UserPageMessageCard(userMessage: contentList[position]);
          }
          return CommonLoadingButton(loadingState: isLoading, hasMore: hasMore);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 5,
            indent: 70,
            color: Color(0xFFDDDDDD),
          );
        },
      ),
    );
  }
}
