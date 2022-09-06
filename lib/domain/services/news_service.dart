import 'package:pavo11_flutter/domain/entities/news_entity.dart';
import 'package:pavo11_flutter/domain/i_repositories/i_news_repo.dart';

class NewsService {
  final INewsRepository newsRepository;

  const NewsService(this.newsRepository);

  Future<List<NewsEntity>> getLatetNews() async {
    try {
      return await newsRepository.getLatestNews();
    } catch (e) {
      // TODO Log error
      rethrow;
    }
  }
}
