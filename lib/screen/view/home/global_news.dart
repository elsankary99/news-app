import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/screen/widget/home_widgets/custom_carosel_slider.dart';
import 'package:news_app/screen/widget/home_widgets/news_card.dart';

class GlobalNewsPage extends ConsumerWidget {
  const GlobalNewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Global News",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount: 20,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsCard(image: imgList[0]);
            },
          ))
        ],
      ),
    );
  }
}
