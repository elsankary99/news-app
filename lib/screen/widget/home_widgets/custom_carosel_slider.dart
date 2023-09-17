import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/provider/breaking_news_provider/breaking_news_provider.dart';
import 'package:news_app/screen/widget/home_widgets/carousel_slider_card.dart';

class CarouselWithIndicatorDemo extends ConsumerStatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState
    extends ConsumerState<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: ref.watch(breakingNewsProvider).when(
                data: (data) => CarouselSlider(
                      items: data
                          .take(5)
                          .map((item) => CarouselSliderCard(news: item))
                          .toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                error: (error, _) => Center(child: Text(error.toString())),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () => _controller.animateToPage(i),
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  width: _current == i ? 25 : 10,
                  height: 10,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: (_current == i
                              ? Theme.of(context).primaryColor
                              : AppColor.grey)
                          .withOpacity(_current == i ? 0.9 : 0.4)),
                ),
              ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: imgList.asMap().entries.map((entry) {
        //     return GestureDetector(
        //       onTap: () => _controller.animateToPage(entry.key),
        //       child: AnimatedContainer(
        //         curve: Curves.easeInOut,
        //         duration: const Duration(milliseconds: 300),
        //         width: _current == entry.key ? 25 : 10,
        //         height: 10,
        //         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(99),
        //             color: (_current == entry.key
        //                     ? AppColor.primaryColor
        //                     : AppColor.grey)
        //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
        //       ),
        //     );
        //   }).toList(),
        // ),
      ],
    );
  }
}
