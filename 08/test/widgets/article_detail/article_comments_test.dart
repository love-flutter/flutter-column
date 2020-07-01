import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:two_you_friend/util/struct/user_info_struct.dart';
import 'package:two_you_friend/util/struct/comment_info_struct.dart';
import 'package:two_you_friend/widgets/article_detail/article_comments.dart';

void main() {
  /// banner 地址信息
  final List<CommentInfoStruct> commentList = [
    CommentInfoStruct(
        UserInfoStruct('flutter',
            'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png'),
        'ts1'),
    CommentInfoStruct(
        UserInfoStruct('flutter2',
            'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png'),
        'ts2'),
    CommentInfoStruct(
        UserInfoStruct('flutter3',
            'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png'),
        'ts3'),
  ];

  testWidgets('test article comments', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final Widget testWidgets = ArticleComments(commentList: commentList);

      await tester.pumpWidget(
          new MaterialApp(
              home: testWidgets
          )
      );

      expect(find.text(commentList[0].userInfo.nickname), findsOneWidget);
      expect(find.text(commentList[0].comment), findsOneWidget);

      expect(find.text(commentList[1].userInfo.nickname), findsOneWidget);
      expect(find.text(commentList[1].comment), findsOneWidget);
      expect(find.byWidget(testWidgets), findsOneWidget);
    });
  });
}