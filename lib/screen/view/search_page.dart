import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/provider/search_pagination_provider.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:news_app/screen/widget/home_widgets/news_card.dart';
import 'package:news_app/screen/widget/search_widgets/Custom_search_text.dart';
import 'package:news_app/screen/widget/search_widgets/Search_appbar.dart';
import 'package:news_app/screen/widget/search_widgets/custom_text_form_feild.dart';
import 'package:news_app/screen/widget/search_widgets/news_type_widget.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

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
          Text(ref.watch(easyExampleProvider.notifier).itemCount),
          const CustomTextFormFelid(),
          const NewsTypeList(),
          const SizedBox(height: 8),
          if (ref.watch(searchKeywordProvider).isEmpty)
            const Center(
              child: Text("Start To Search"),
            )
          else
            Expanded(
              child: RiverPagedBuilder<int, NewsModel>(
                firstPageKey: 1,
                newPageProgressIndicatorBuilder: (context, controller) =>
                    const Text("Loading"),
                provider: easyExampleProvider,
                itemBuilder: (context, item, index) => NewsCard(news: item),
                pagedBuilder: (controller, builder) => PagedListView(
                    pagingController: controller, builderDelegate: builder),
              ),
              // child: ref.watch(searchNewsProvider).when(
              //       skipLoadingOnRefresh: false,
              //       skipLoadingOnReload: false,
              //       data: (data) => data.isNotEmpty
              //           ? ListView.builder(
              //               padding: const EdgeInsets.only(top: 8),
              //               itemCount: data.length,
              //               physics: const BouncingScrollPhysics(),
              //               itemBuilder: (context, index) {
              //                 return NewsCard(news: data[index]);
              //               },
              //             )
              //           : const Center(child: Text("No Result Found")),
              //       error: (error, _) =>
              //           Center(child: Text(error.toString())),
              //       loading: () => const Center(
              //         child: CircularProgressIndicator(),
              //       ),
              //     )
            )
        ]),
      ),
    );
  }
}
