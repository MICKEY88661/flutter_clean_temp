import '../models/news_model.dart';

abstract class INewsRemoteSource {
  Future<List<NewsModel>> getLatestNews();
}
