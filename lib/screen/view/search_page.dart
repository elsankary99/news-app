import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/screen/widget/home_widgets/custom_carosel_slider.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: const SearchPageAppBar(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomSearchText(),
          CustomTextFormFelid(),
          NewsTypeList(),
          SizedBox(height: 8),
          //TODO:(3)

          // Expanded(
          //     child: ListView.builder(
          //   padding: const EdgeInsets.only(top: 8),
          //   itemCount: 20,
          //   physics: const BouncingScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return NewsCard(image: imgList[0]);
          //   },
          // ))
        ]),
      ),
    );
  }
}
