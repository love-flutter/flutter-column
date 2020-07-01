import 'package:flutter_test/flutter_test.dart';

import 'package:two_you_friend/util/struct/article_summary_struct.dart';

void main() {
  final ArticleSummaryStruct articleSummary = ArticleSummaryStruct('test', 'test summary', 'http://test.com', 1, 2);

  test('test article summary', () {
    expect(articleSummary.title, 'test');
    expect(articleSummary.summary, 'test summary');
    expect(articleSummary.articleImage, 'http://test.com');
    expect(articleSummary.likeNum, 1);
    expect(articleSummary.commentNum, 2);
  });

}