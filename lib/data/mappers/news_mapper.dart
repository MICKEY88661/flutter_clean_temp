import 'package:pavo11_flutter/data/mappers/i_mapper.dart';
import 'package:pavo11_flutter/data/models/news_model.dart';
import 'package:pavo11_flutter/domain/entities/news_entity.dart';

class NewsMapper implements IMapper<NewsModel, NewsEntity> {
  const NewsMapper();

  @override
  NewsEntity toEntity(NewsModel model) {
    return NewsEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      url: model.url,
      author: model.author,
      image: model.image,
      language: model.language,
      category: model.category,
      published: model.published,
    );
  }

  @override
  NewsModel toModel(NewsEntity entity) {
    return NewsModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      author: entity.author,
      image: entity.image,
      language: entity.language,
      category: entity.category,
      published: entity.published,
    );
  }
}
