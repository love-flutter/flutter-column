import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:two_you_friend/pages/user_page/index.dart';

// @todo
void main() {
  testWidgets('test two_you_friend/pages/user_page/index.dart', (WidgetTester tester) async {
     final Widget testWidgets = UserPageIndex();
      await tester.pumpWidget(
          new MaterialApp(
              home: testWidgets
          )
      );

      expect(find.byWidget(testWidgets), findsOneWidget);
  });
}