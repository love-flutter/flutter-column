import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:two_you_friend/pages/common/web_view_page.dart';

// @todo
void main() {
  testWidgets('test two_you_friend/pages/common/web_view_page.dart', (WidgetTester tester) async {
     final Widget testWidgets = CommonWebViewPage(url: 'http://www.qq.com');
      await tester.pumpWidget(
          new MaterialApp(
              home: testWidgets
          )
      );

      expect(find.byWidget(testWidgets), findsOneWidget);
  });
}