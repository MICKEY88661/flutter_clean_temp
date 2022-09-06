import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pavo11_flutter/data/models/news_model.dart';

import 'i_news_remote_source.dart';

class NewsRemoteSource implements INewsRemoteSource {
  final Dio dio;
  const NewsRemoteSource(this.dio);

  @override
  Future<List<NewsModel>> getLatestNews() async {
    try {
      List<NewsModel> news = [];
      final resonse = await dio.get("/v1/latest-news");
      for (var n in resonse.data["news"]) {
        news.add(NewsModel.fromJson(n));
      }
      return news;
    } catch (e) {
      // TODO Log error
      rethrow;
    }
  }
}
