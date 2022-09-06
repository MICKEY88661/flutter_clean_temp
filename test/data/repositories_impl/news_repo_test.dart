import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pavo11_flutter/data/data_sources/news_remote_source.dart';
import 'package:pavo11_flutter/data/mappers/news_mapper.dart';
import 'package:pavo11_flutter/data/repositories_impl/news_repo_impl.dart';

import 'news_repo_test.mocks.dart';

@GenerateMocks([NewsRemoteSource, NewsMapper])
void main() {
  late NewsRepository newsRepository;
  late NewsRemoteSource mockRemoteSource;
  late NewsMapper mockMapper;

  setUp(() {
    mockRemoteSource = MockNewsRemoteSource();
    mockMapper = MockNewsMapper();
    newsRepository = NewsRepository(
      mockRemoteSource,
      mockMapper,
    );
  });

  test("getLatestNews-empty", () async {
    when(mockRemoteSource.getLatestNews()).thenAnswer((_) async => []);

    final result = await newsRepository.getLatestNews();

    expect(result, equals([]));
  });
}
