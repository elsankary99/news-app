import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/constant/app_string.dart';
import 'package:news_app/core/extension/media_query.dart';
import 'package:news_app/data/model/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: context.height * 0.16,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  height: context.height * 0.17,
                  news.urlToImage ?? AppStrings.notFoundImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.source!.name ?? "Un Known",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(
                    news.description ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        maxRadius: 16,
                      ),
                      Text(
                        DateFormat("MMM d, yyyy")
                            .format(DateTime.parse(news.publishedAt!)),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
