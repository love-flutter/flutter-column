import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/widgets/article_detail/article_detail_like.dart';

void main() {
  final LikeNumModel likeNumModel = LikeNumModel();

  testWidgets('test article like widget', (WidgetTester tester) async {
    final Widget testWidgets = ArticleDetailLike();
    await tester.pumpWidget(
        new Provider<int>.value(
            child: ChangeNotifierProvider.value(
              value: likeNumModel,
              child: MaterialApp(
                  home: testWidgets
              ),
            )
        )
    );
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byIcon(Icons.thumb_up), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

  });

  testWidgets('test article like widget when like action', (WidgetTester tester) async {
    final Widget testWidgets = ArticleDetailLike();
    await tester.pumpWidget(
        new Provider<int>.value(
            child: ChangeNotifierProvider.value(
              value: likeNumModel,
              child: MaterialApp(
                  home: testWidgets
              ),
            )
        )
    );
    await tester.tap(find.byType(FlatButton));

    await Future.microtask(tester.pump);

    expect(find.text('1'), findsOneWidget);

  });


}