import '../../utils/logger.dart';
import '../models/news/news_model.dart';
import '../../domain/entities/news_entity.dart';
import 'i_mapper.dart';

class NewsMapper implements IMapper<NewsModel, NewsEntity> {
  const NewsMapper();

  @override
  NewsEntity toEntity(NewsModel model) {
    try {
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
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  NewsModel toModel(NewsEntity entity) {
    try {
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
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }
}
