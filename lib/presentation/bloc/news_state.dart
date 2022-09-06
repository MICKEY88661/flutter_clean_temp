import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavo11_flutter/domain/entities/news_entity.dart';

class NewsState extends Equatable {
  final AsyncValue<List<NewsEntity>> news;

  const NewsState({
    required this.news,
  });

  NewsState copyWith({
    AsyncValue<List<NewsEntity>>? news,
  }) {
    return NewsState(
      news: news ?? this.news,
    );
  }

  @override
  List<Object?> get props => [news];
}
