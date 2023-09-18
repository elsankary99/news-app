import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/new_repository.dart';

final searchKeywordProvider = StateProvider<String>((ref) => "");
final searchNewsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final newsRepo = ref.read(newsRepoProvider);
  final keyWord = ref.watch(searchKeywordProvider);

  return newsRepo.finedMany(keyWord: keyWord);
  // return data.getAllNews(
  //     "/everything?q=$keyWord&page=1&pageSize=20&apiKey=${AppUrls.apiKey}");
});
