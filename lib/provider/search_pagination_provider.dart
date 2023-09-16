import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/new_repository.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

final easyExampleProvider =
    StateNotifierProvider<EasyExampleNotifier, PagedState<int, NewsModel>>(
        (ref) {
  final newsRepo = ref.read(newsRepoProvider);
  final keyWord = ref.watch(searchKeywordProvider);
  return EasyExampleNotifier(newsRepo, keyWord);
});

class EasyExampleNotifier extends PagedNotifier<int, NewsModel> {
  EasyExampleNotifier(NewRepository repo, String keyWord)
      : super(
          //load is a required method of PagedNotifier
          load: (page, limit) {
            return repo.finedMany(keyWord: keyWord, page: page, limit: limit);
          },

          //nextPageKeyBuilder is a required method of PagedNotifier
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
  String get itemCount => state.records?.length.toString() ?? "";
}
