import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/constant/app_urls.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/new_repository.dart';

final searchNewsProvider = FutureProvider.family
    .autoDispose<List<NewsModel>, String>((ref, search) async {
  final data = ref.read(newsRepoProvider);

  return data.getAllNews(
      "/everything?q=$search&page=1&pageSize=20&apiKey=${AppUrls.apiKey}");
});
