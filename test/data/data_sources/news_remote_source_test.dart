import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pavo11_flutter/data/core/i_remote_client.dart';
import 'package:pavo11_flutter/data/data_sources/news/news_remote_source.dart';

import 'news_remote_source_test.mocks.dart';

@GenerateMocks([IRemoteClient])
void main() {
  late NewsRemoteSource newsRemoteSource;
  late IRemoteClient mockClient;
  setUp(() {
    mockClient = MockIRemoteClient();
    newsRemoteSource = NewsRemoteSource(mockClient);
  });
  // TODO fix test
  test("getLatestNews-empty", () async {
    when(mockClient.get("/v1/latest-news")).thenAnswer((_) async => []
        // Response(
        //   data: {
        //     "status": "ok",
        //     "news": [],
        //   },
        //   requestOptions: RequestOptions(path: '/v1/latest-news'),
        // ),
        );
    final result = await newsRemoteSource.getLatestNews();
    expect(result, equals([]));
  });
}
