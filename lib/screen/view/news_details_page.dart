import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/constant/app_string.dart';
import 'package:news_app/core/extension/media_query.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/screen/widget/news_details_widgets/custom_appbar_button.dart';

@RoutePage()
class NewsDetailsPage extends ConsumerWidget {
  final NewsModel news;

  const NewsDetailsPage(this.news, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              // floating: false,
              // pinned: false,
              leading: CustomAppBarButton(
                  icon: FontAwesomeIcons.chevronLeft,
                  onTap: () {
                    context.router.pop();
                  }),
              elevation: 0,
              backgroundColor: Colors.white,
              expandedHeight: context.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: news.urlToImage ?? AppStrings.notFoundImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: context.height * 0.04)
                  ],
                ),
              ),
              //  Stack(children: [
              //   Positioned(
              //       child: CachedNetworkImage(
              //     imageUrl: news.urlToImage ?? AppStrings.notFoundImage,
              //     fit: BoxFit.fill,
              //     height: context.height * 0.375,
              //   ))
              // ]),

              bottom: PreferredSize(
                  preferredSize: Size(context.width, context.height * 0.1),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: context.height * 0.075,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            // offset: Offset(0, -5),
                            // blurRadius: 20,
                            // blurStyle: BlurStyle.outer,
                            // color: Colors.black,
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0.02,
                            blurRadius: 4.5,
                            offset: const Offset(0, -6.5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(),
                            const SizedBox(width: 15),
                            Text(
                              news.source!.name ?? "Un Known",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 22),
                            )
                          ]),
                    ),
                  )),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                news.description ?? "There is no Description",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
