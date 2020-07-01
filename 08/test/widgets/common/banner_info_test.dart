import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:two_you_friend/widgets/common/banner_info.dart';

void main() {
  testWidgets('test banner info', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final Widget testWidgets = BannerInfo(
          bannerImage: 'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png'
      );
      await tester.pumpWidget(
          new MaterialApp(
              home: testWidgets
          )
      );

      expect(find.byWidget(testWidgets), findsOneWidget);
    });
  });
}