import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/constant/app_urls.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/new_repository.dart';

final globalNewsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final data = ref.watch(newsRepoProvider);
  return data.getAllNews(AppUrls.endPoint);
});
