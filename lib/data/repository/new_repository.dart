import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/service/news_sevice.dart';

final newsRepoProvider = Provider<NewRepository>((ref) => NewRepository());

class NewRepository {
  NewsService newsService = NewsService();

  Future<List<NewsModel>> getAllNews(String endPoint) async {
    final data = await newsService.fetchData(endPoint);
    List<NewsModel> newsList = [];
    for (var news in data["articles"]) {
      newsList.add(NewsModel.fromJson(news));
    }
    return newsList;
  }
}
