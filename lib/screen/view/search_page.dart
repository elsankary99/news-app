import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/provider/search_provider/search_pagination_provider.dart';
import 'package:news_app/provider/search_provider/search_provider.dart';
import 'package:news_app/screen/widget/home_widgets/news_card.dart';
import 'package:news_app/screen/widget/search_widgets/Custom_search_text.dart';
import 'package:news_app/screen/widget/search_widgets/custom_text_form_feild.dart';
import 'package:news_app/screen/widget/search_widgets/news_type_widget.dart';
import 'package:news_app/screen/widget/shimmer/loading_indecator.dart';
import 'package:news_app/screen/widget/shimmer/news_card_shimmer.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomSearchText(),
        const CustomTextFormFelid(),
        const NewsTypeList(),
        const SizedBox(height: 20),
        Expanded(
          child: ref.watch(searchKeywordProvider).isEmpty
              ? Center(
                  child: Text(
                    "Search or Select type",
                    style: TextStyle(
                        fontSize: 18, color: Theme.of(context).primaryColor),
                  ),
                )
              : RiverPagedBuilder<int, NewsModel>(
                  firstPageKey: 1,
                  provider: easyExampleProvider,
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
        )
      ]),
    );
  }
}
