import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:two_you_friend/widgets/article_detail/article_content.dart';

void main() {
  testWidgets('test article content', (WidgetTester tester) async {
    final Widget testWidgets = ArticleContent(content: 'test content');
    await tester.pumpWidget(
        new MaterialApp(
            home: testWidgets
        )
    );

    expect(find.text('test content'), findsOneWidget);
    expect(find.byWidget(testWidgets), findsOneWidget);
  });
}