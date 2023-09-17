import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/extension/media_query.dart';
import 'package:news_app/core/router/app_router.dart';
import 'package:news_app/provider/recommendation_provider/recommendation_news_provider.dart';
import 'package:news_app/screen/widget/home_widgets/custom_carosel_slider.dart';
import 'package:news_app/screen/widget/home_widgets/custom_text.dart';
import 'package:news_app/screen/widget/home_widgets/news_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CustomText(
            title: "Breaking News",
            onPressed: () => context.router.push(const BreakingNewsRoute())),
        SizedBox(
            height: context.height * 0.29,
            child: const CarouselWithIndicatorDemo()),
        CustomText(
            title: "Recommendation",
            onPressed: () => context.router.push(const RecommendationRoute())),
        const SizedBox(height: 10),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ref.watch(recommendationProvider).when(
                data: (data) => data.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: 6,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsCard(news: data[index]);
                        },
                      )
                    : const Center(child: Text("No Result Found")),
                error: (error, _) => Center(child: Text(error.toString())),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        ))
      ],
    );
  }
}
