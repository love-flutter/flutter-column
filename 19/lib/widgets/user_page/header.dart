import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/user_info_model.dart';
import 'package:two_you_friend/styles/text_syles.dart';

/// 头部信息部分
class UserPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfoModel = Provider.of<UserInfoModel>(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            flex: 5,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    userInfoModel.value.headerUrl,
                    width: 60,
                    height: 60,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  userInfoModel.value.nickName,
                  style: TextStyles.commonStyle(),
                ),
                Padding(padding: EdgeInsets.only(bottom: 120)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.chevron_right,
                  color: Colors.lightBlueAccent,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 20)),
        ],
      ),
    );
  }
}
