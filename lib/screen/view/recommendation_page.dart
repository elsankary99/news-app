import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/provider/recommendation_provider/recom_pagination_news_provider.dart';
import 'package:news_app/screen/widget/home_widgets/news_card.dart';
import 'package:news_app/screen/widget/search_widgets/Search_appbar.dart';
import 'package:news_app/screen/widget/shimmer/loading_indecator.dart';
import 'package:news_app/screen/widget/shimmer/news_card_shimmer.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

@RoutePage()
class RecommendationPage extends ConsumerWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        flexibleSpace: const SearchPageAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recommendation",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: RiverPagedBuilder<int, NewsModel>(
                firstPageKey: 1,
                provider: recommendationPaginationProvider,
                newPageProgressIndicatorBuilder: (context, controller) =>
                    const NewsCardShimmer(),
                firstPageProgressIndicatorBuilder: (context, controller) =>
                    const Padding(
                  padding: EdgeInsets.all(150),
                  child: LoadingIndicatorWidget(),
                ),
                itemBuilder: (context, item, index) => NewsCard(news: item),
                pagedBuilder: (controller, builder) => PagedListView(
                    pagingController: controller, builderDelegate: builder),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
