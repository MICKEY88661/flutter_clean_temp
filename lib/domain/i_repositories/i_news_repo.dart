import 'package:pavo11_flutter/domain/entities/news_entity.dart';

abstract class INewsRepository {
  Future<List<NewsEntity>> getLatestNews();
}
