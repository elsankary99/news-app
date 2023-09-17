import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/new_repository.dart';

final recommendationProvider = FutureProvider<List<NewsModel>>((ref) async {
  final repo = ref.read(newsRepoProvider);
  return repo.recommendationNews();
});
