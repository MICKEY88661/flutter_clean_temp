import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/services/news_service.dart';
import 'news_state.dart';

final newsCtrlProvider =
    StateNotifierProvider.autoDispose<NewsController, NewsState>((ref) {
  final newsService = ref.watch(newsServiceProvider);

  return NewsController(
    const NewsState(
      news: AsyncLoading(),
    ),
    service: newsService,
  );
});

class NewsController extends StateNotifier<NewsState> {
  final NewsService service;

  NewsController(
    super.state, {
    required this.service,
  }) {
    getLatestNews();
  }

  Future<void> getLatestNews() async {
    try {
      // loading
      state = state.copyWith(news: const AsyncLoading());
      // get
      final news = await service.getLatetNews();
      // sort
      news.sort((a, b) {
        if (a.published == null || b.published == null) {
          return 0;
        }
        return b.published!.compareTo(a.published!);
      });
      // assign
      state = state.copyWith(news: AsyncData(news));
    } catch (e) {
      state = state.copyWith(news: AsyncError(e));
    }
  }
}
