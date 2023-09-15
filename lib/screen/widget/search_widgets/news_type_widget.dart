import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/enum/news_type.dart';

class NewsTypeList extends StatefulWidget {
  const NewsTypeList({
    super.key,
  });

  @override
  State<NewsTypeList> createState() => _NewsTypeListState();
}

class _NewsTypeListState extends State<NewsTypeList> {
  int selectedType = 0;
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
                            ? AppColor.primaryColor
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
