import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/constant/app_string.dart';
import 'package:news_app/data/model/news_model.dart';

class CarouselSliderCard extends StatelessWidget {
  final NewsModel news;

  const CarouselSliderCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.network(
                    news.urlToImage ?? AppStrings.notFoundImage,
                    fit: BoxFit.cover)),
            Positioned.fill(
                child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            )),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
              ),
            ),
            Positioned(
                bottom: 15,
                left: 15,
                right: 0.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          news.source!.name ?? "Un Known",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColor.primaryColor,
                            child: Icon(
                              FontAwesomeIcons.check,
                              size: 10,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat("MMM d, yyyy")
                              .format(DateTime.parse(news.publishedAt!)),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      news.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
          ],
        ));
  }
}
