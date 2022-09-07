import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pavo11_flutter/data/data_sources/news_remote_source.dart';

import 'news_remote_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late NewsRemoteSource newsRemoteSource;
  late Dio mockDio;
  setUp(() {
    mockDio = MockDio();
    newsRemoteSource = NewsRemoteSource(mockDio);
  });

  test("getLatestNews-empty", () async {
    when(mockDio.get("/v1/latest-news")).thenAnswer(
      (_) async => Response(
        data: {
          "status": "ok",
          "news": [],
        },
        requestOptions: RequestOptions(path: '/v1/latest-news'),
      ),
    );
    final result = await newsRemoteSource.getLatestNews();
    expect(result, equals([]));
  });
}
