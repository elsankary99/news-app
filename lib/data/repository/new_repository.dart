import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/service/news_sevice.dart';

final newsRepoProvider = Provider<NewRepository>((ref) => NewRepository());

class NewRepository {
  NewsService newsService = NewsService();
  final dio = Dio();

  Future<List<NewsModel>> finedMany({
    required String keyWord,
    int limit = 12,
    int page = 1,
  }) async {
    final res = await dio.get(
      "https://newsapi.org/v2/everything",
      queryParameters: {
        "q": keyWord,
        "apiKey": "d5749ebe78b84fc8a6eab777d8fa6551",
        "pageSize": limit,
        "page": page,
      },
    );
    final data = res.data["articles"] as List;

    return data.map((e) => NewsModel.fromJson(e)).toList();
  }

  Future<List<NewsModel>> getGlobalNews({
    int limit = 20,
    int page = 1,
  }) async {
    final res =
        await dio.get("https://newsapi.org/v2/everything", queryParameters: {
      "q": "la league",
      "page": page,
      "pageSize": limit,
      "apiKey": "d5749ebe78b84fc8a6eab777d8fa6551",
    });
    final data = res.data["articles"] as List;
    return data.map((e) => NewsModel.fromJson(e)).toList();
  }

  Future<List<NewsModel>> recommendationNews(
      {int limit = 20, int page = 1}) async {
    final res =
        await dio.get("https://newsapi.org/v2/everything", queryParameters: {
      "q": "earthquake",
      "apiKey": "d5749ebe78b84fc8a6eab777d8fa6551",
      "pageSize": limit,
      "page": page,
    });
    final data = res.data["articles"] as List;
    return data.map((e) => NewsModel.fromJson(e)).toList();
  }

  Future<List<NewsModel>> breakingNews({
    int page = 1,
    int limit = 20,
  }) async {
    final res =
        await dio.get("https://newsapi.org/v2/everything", queryParameters: {
      "q": "Apple",
      "page": page,
      "pageSize": limit,
      "apiKey": "d5749ebe78b84fc8a6eab777d8fa6551",
    });
    final data = res.data["articles"] as List;
    return data.map((e) => NewsModel.fromJson(e)).toList();
  }
}
