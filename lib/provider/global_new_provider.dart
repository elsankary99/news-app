import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/new_repository.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

final getGlobalProvider =
    StateNotifierProvider<EasyExampleNotifier, PagedState<int, NewsModel>>(
        (ref) {
  final repo = ref.read(newsRepoProvider);
  return EasyExampleNotifier(repo);
});

class EasyExampleNotifier extends PagedNotifier<int, NewsModel> {
  EasyExampleNotifier(NewRepository repo)
      : super(
          load: (page, limit) {
            return repo.getGlobalNews(limit: limit, page: page);
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}
