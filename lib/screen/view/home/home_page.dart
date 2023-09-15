import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/extension/media_query.dart';
import 'package:news_app/core/router/app_router.dart';
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
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return NewsCard(
                image: imgList[index],
              );
            },
          ),
        ))
      ],
    );
  }
}
