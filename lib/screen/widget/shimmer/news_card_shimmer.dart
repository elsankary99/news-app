import 'package:flutter/material.dart';
import 'package:news_app/core/extension/media_query.dart';
import 'package:news_app/screen/widget/shimmer/shimmer_widget.dart';

class NewsCardShimmer extends StatelessWidget {
  const NewsCardShimmer({super.key});

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
                child: const ShimmerWidget(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 10,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const ShimmerWidget())),
                  SizedBox(
                      height: 10,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const ShimmerWidget())),
                  SizedBox(
                      height: 10,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const ShimmerWidget())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
