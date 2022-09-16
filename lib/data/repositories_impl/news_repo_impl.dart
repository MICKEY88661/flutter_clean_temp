import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/news_entity.dart';
import '../../domain/i_repositories/i_news_repo.dart';
import '../../utils/logger.dart';
import '../core/currents_client.dart';
import '../data_sources/news/news_remote_source.dart';
import '../mappers/news_mapper.dart';

final newsRepoProvider = Provider<INewsRepository>((ref) {
  final currentClient = ref.watch(currentsClientProvider);

  return NewsRepository(
    NewsRemoteSource(currentClient),
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
      Logger().level(Level.error).at(this).log(e);

      rethrow;
    }
  }
}
