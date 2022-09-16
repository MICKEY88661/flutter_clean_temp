import 'package:pavo11_flutter/utils/logger.dart';

import '../../models/news/news_model.dart';
import '../../core/i_remote_client.dart';
import 'i_news_remote_source.dart';

class NewsRemoteSource implements INewsRemoteSource {
  final IRemoteClient client;
  const NewsRemoteSource(this.client);

  @override
  Future<List<NewsModel>> getLatestNews() async {
    try {
      List<NewsModel> news = [];
      final resonse = await client.get("/v1/latest-news");
      for (var n in resonse["news"]) {
        news.add(NewsModel.fromJson(n));
      }
      return news;
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }
}
