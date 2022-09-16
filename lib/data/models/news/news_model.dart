import 'package:json_annotation/json_annotation.dart';

import '../../../utils/logger.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String? id;
  final String? title;
  final String? description;
  final String? url;
  final String? author;
  final String? image;
  final String? language;
  final List<String>? category;
  final DateTime? published;

  const NewsModel({
    this.id,
    this.title,
    this.description,
    this.url,
    this.author,
    this.image,
    this.language,
    this.category,
    this.published,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$NewsModelFromJson(json);
    } catch (e) {
      Logger().level(Level.error).at(NewsModel).log(e);
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return _$NewsModelToJson(this);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }
}
