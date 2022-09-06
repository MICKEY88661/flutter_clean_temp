import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavo11_flutter/domain/entities/news_entity.dart';
import 'package:pavo11_flutter/domain/i_repositories/i_news_repo.dart';

import '../core/http_client.dart';
import '../data_sources/news_remote_source.dart';
import '../mappers/news_mapper.dart';

final newsRepoProvider = Provider<INewsRepository>((ref) {
  final currentDio = ref.watch(currentsDioProvider);

  return NewsRepository(
    NewsRemoteSource(currentDio),
    const NewsMapper(),
  );
});

class NewsRepository implements INewsRepository {
  final NewsRemoteSource remoteSource;
  final NewsMapper mapper;
  const NewsRepository(this.remoteSource, this.mapper);

  @override
  Future<List<NewsEntity>> getLatestNews() async {
    try {
      final newsModel = await remoteSource.getLatestNews();
      List<NewsEntity> news = [];
      for (var m in newsModel) {
        news.add(mapper.toEntity(m));
      }
      return news;
    } catch (e) {
      // TODO Log error
      rethrow;
    }
  }
}
