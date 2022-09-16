import '../entities/news_entity.dart';

abstract class INewsRepository {
  Future<List<NewsEntity>> getLatestNews();
}
