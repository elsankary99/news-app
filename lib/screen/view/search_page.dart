import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:news_app/screen/widget/home_widgets/news_card.dart';
import 'package:news_app/screen/widget/search_widgets/Custom_search_text.dart';
import 'package:news_app/screen/widget/search_widgets/Search_appbar.dart';
import 'package:news_app/screen/widget/search_widgets/custom_text_form_feild.dart';
import 'package:news_app/screen/widget/search_widgets/news_type_widget.dart';

@RoutePage()
class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("===restart===");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: const SearchPageAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomSearchText(),
          const CustomTextFormFelid(),
          const NewsTypeList(),
          const SizedBox(height: 8),
          Expanded(
              child: ref.watch(searchNewsProvider("nokia")).when(
                    skipLoadingOnRefresh: false,
                    skipLoadingOnReload: false,
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
        ]),
      ),
    );
  }
}
