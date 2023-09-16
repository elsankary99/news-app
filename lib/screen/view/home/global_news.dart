import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/global_news_provider.dart';
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
              child: ref.watch(globalNewsProvider).when(
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
                    error: (error, _) => Center(child: Text(error.toString())),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))
        ],
      ),
    );
  }
}
