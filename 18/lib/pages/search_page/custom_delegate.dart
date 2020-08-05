import 'package:flutter/material.dart';

import 'package:two_you_friend/api/search/index.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/user_page/card.dart';
import 'package:two_you_friend/widgets/search/content_card.dart';
import 'package:two_you_friend/styles/text_syles.dart';

/// 搜索框
class SearchPageCustomDelegate extends SearchDelegate {
  /// 修改提示框内容
  String get searchFieldLabel => '用户、贴子';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: _getSearchResult(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          return Container(padding: EdgeInsets.all(10), child: snapshot.data);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: _getSuggestList(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          return Container(
            padding: EdgeInsets.all(10),
            child: snapshot.data,
          );
        });
  }

  /// 获取搜索结果组件数据
  Future<Widget> _getSearchResult() async {
    Map<String, dynamic> searchResult = await ApiSearchIndex.main(query);

    List<Widget> columnWidgets = [];

    columnWidgets.add(Padding(padding: EdgeInsets.only(top: 5)));

    if (searchResult['userList'] != null) {
      List<StructUserInfo> userList = [];
      (searchResult['userList'] as List).forEach((userInfo) {
        userList.add(StructUserInfo.fromJson(userInfo as Map<String, dynamic>));
      });
      columnWidgets.add(_getUserListWidget(userList));

      if (userList.length > 0) {
        columnWidgets.add(
            Divider(height: 1.0, indent: 0, color: Colors.lightBlueAccent));

        columnWidgets.add(Padding(padding: EdgeInsets.only(top: 5)));
      }
    }

    if (searchResult['contentList'] != null) {
      List<StructContentDetail> contentList = [];
      (searchResult['contentList'] as List).forEach((contentInfo) {
        contentList.add(
            StructContentDetail.fromJson(contentInfo as Map<String, dynamic>));
      });
      columnWidgets.add(_getContentListWidget(contentList));
    }
    return Column(
      children: columnWidgets,
    );
  }

  /// 获取用户搜索结果组件
  Widget _getUserListWidget(List<StructUserInfo> userList) {
    if (userList == null || userList.length < 1) {
      return Container();
    }

    int subLen = userList.length > 5 ? 5 : userList.length;

    List<StructUserInfo> subUserList = userList.sublist(0, subLen);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: subUserList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  '用户',
                  style: TextStyles.commonStyle(0.9),
                ),
              ],
            );
          }
          return UserPageCard(userInfo: subUserList[index - 1]);
        });
  }

  /// 获取内容搜索结果组件
  Widget _getContentListWidget(List<StructContentDetail> contentList) {
    if (contentList == null || contentList.length < 1) {
      return Container();
    }

    int subLen = contentList.length > 10 ? 10 : contentList.length;

    List<StructContentDetail> subUserList = contentList.sublist(0, subLen);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: subUserList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  '贴子',
                  style: TextStyles.commonStyle(0.9),
                ),
              ],
            );
          }
          return SearchContentCard(contentInfo: contentList[index - 1]);
        });
  }

  /// 获取 suggest list组件列表
  Future<Widget> _getSuggestList() async {
    List<String> suggests = await ApiSearchIndex.suggest(query);

    if (suggests == null || suggests.length < 1) {
      return Container();
    }

    int subLen = suggests.length > 5 ? 5 : suggests.length;

    List<String> subSuggests = suggests.sublist(0, subLen);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: subSuggests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: RichText(
                text: TextSpan(
                    // 获取搜索框内输入的字符串，设置它的颜色并让让加粗
                    text: subSuggests[index],
                    style: TextStyles.commonStyle())),
            onTap: () {
              query = subSuggests[index];
              showResults(context);
            },
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(),
        primaryColor: theme.primaryColor,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme);
  }
}
