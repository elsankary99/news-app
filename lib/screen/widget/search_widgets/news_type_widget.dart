import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/enum/news_type.dart';
import 'package:news_app/provider/search_provider/search_provider.dart';

class NewsTypeList extends ConsumerStatefulWidget {
  const NewsTypeList({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsTypeListState();
}

class _NewsTypeListState extends ConsumerState<NewsTypeList> {
  int? selectedType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            ...NewsType.values.map((type) => GestureDetector(
                  onTap: () {
                    ref.read(searchKeywordProvider.notifier).state = type.type;
                    setState(() {
                      selectedType = type.index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                        color: selectedType == type.index
                            ? Theme.of(context).primaryColor
                            : AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      type.type,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedType == type.index
                              ? Colors.white
                              : Colors.grey),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
