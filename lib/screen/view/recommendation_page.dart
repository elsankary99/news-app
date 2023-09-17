import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/recommendation_news_provider.dart';
import 'package:news_app/screen/widget/home_widgets/news_card.dart';
import 'package:news_app/screen/widget/search_widgets/Search_appbar.dart';

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
                child: ref.watch(recommendationProvider).when(
                      data: (data) => data.isNotEmpty
                          ? ListView.builder(
                              padding: const EdgeInsets.only(top: 8),
                              itemCount: data.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return NewsCard(news: data[index]);
                              },
                            )
                          : const Center(child: Text("No Result Found")),
                      error: (error, _) =>
                          Center(child: Text(error.toString())),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
