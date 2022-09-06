import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pavo11_flutter/domain/i_repositories/i_news_repo.dart';
import 'package:pavo11_flutter/domain/services/news_service.dart';

import 'news_service_test.mocks.dart';

@GenerateMocks([INewsRepository])
void main() {
  late INewsRepository mockNewsRepository;
  late NewsService newsService;

  setUp(() {
    mockNewsRepository = MockINewsRepository();
    newsService = NewsService(mockNewsRepository);
  });

  test("getLatestNews-empty", () async {
    // arrange
    when(mockNewsRepository.getLatestNews()).thenAnswer((_) async => []);
    // act
    final result = await newsService.getLatetNews();
    // assert
    expect(result, equals([]));
  });
}
