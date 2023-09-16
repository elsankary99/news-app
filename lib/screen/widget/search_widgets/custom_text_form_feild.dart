import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/provider/search_provider.dart';

class CustomTextFormFelid extends ConsumerWidget {
  const CustomTextFormFelid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColor.lightGrey),
      child: TextFormField(
        onFieldSubmitted: (value) {
          ref.read(searchNewsProvider(value));
          log(value);
        },
        decoration: const InputDecoration(
          hintText: "  Search",
          suffixIcon: Icon(
            FontAwesomeIcons.sliders,
            size: 20,
          ),
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
