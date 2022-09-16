import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pavo11_flutter/domain/services/news_service.dart';
import 'package:pavo11_flutter/presentation/bloc/news/news_controller.dart';
import 'package:pavo11_flutter/presentation/bloc/news/news_state.dart';

import 'news_bloc_test.mocks.dart';

@GenerateMocks([NewsService])
void main() {
  late NewsController newsController;
  late NewsService mockNewsService;
  late NewsState mockNewsState;

  setUp(() {
    mockNewsService = MockNewsService();
    mockNewsState = const NewsState(news: AsyncValue.loading());
    newsController = NewsController(
      mockNewsState,
      service: mockNewsService,
    );
  });

  test("getLatestNews-empty", () async {
    when(mockNewsService.getLatetNews()).thenAnswer((_) async => []);

    await newsController.getLatestNews();

    expect(
      newsController.state.news.value,
      equals([]),
    );
  });

  test("getLatestNews-error", () async {
    when(mockNewsService.getLatetNews()).thenThrow(Error());
    await newsController.getLatestNews();

    expect(
      newsController.state.news,
      const TypeMatcher<AsyncError>(),
    );
  });
}
