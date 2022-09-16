import '../../models/news/news_model.dart';

abstract class INewsRemoteSource {
  Future<List<NewsModel>> getLatestNews();
}
