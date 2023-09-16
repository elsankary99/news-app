import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/constant/app_urls.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/new_repository.dart';

final breakingNewsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final data = ref.read(newsRepoProvider);

  return data.getAllNews(
      "${AppUrls.baseUrl}/everything?q=Apple&page=1&pageSize=20&apiKey=${AppUrls.apiKey}");
});
