import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories_impl/news_repo_impl.dart';
import '../../utils/logger.dart';
import '../entities/news_entity.dart';
import '../i_repositories/i_news_repo.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  final newsRepo = ref.watch(newsRepoProvider);
  return NewsService(newsRepo);
});

class NewsService {
  final INewsRepository newsRepository;

  const NewsService(this.newsRepository);

  Future<List<NewsEntity>> getLatetNews() async {
    try {
      return await newsRepository.getLatestNews();
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);

      rethrow;
    }
  }
}
