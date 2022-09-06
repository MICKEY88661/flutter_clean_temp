import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavo11_flutter/presentation/bloc/news_state.dart';

import '../../data/repositories_impl/news_repo_impl.dart';
import '../../domain/services/news_service.dart';

final newsCtrlProvider =
    StateNotifierProvider.autoDispose<NewsController, NewsState>((ref) {
  final newsRepo = ref.watch(newsRepoProvider);

  return NewsController(
    const NewsState(
      news: AsyncLoading(),
    ),
    service: NewsService(newsRepo),
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
      state = state.copyWith(news: const AsyncLoading());
      final news = await service.getLatetNews();
      state = state.copyWith(news: AsyncData(news));
    } catch (e) {
      state = state.copyWith(news: AsyncError(e));
    }
  }
}
