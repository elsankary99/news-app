import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/router/app_router.dart';
import 'package:news_app/screen/widget/home_widgets/custom_icon.dart';

final testProvider = StateProvider<String>((ref) => "");

class CustomHomeAppBar extends ConsumerWidget {
  const CustomHomeAppBar({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIcon(
                  onTap: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: FontAwesomeIcons.bars),
              Row(
                children: [
                  CustomIcon(
                      onTap: () => context.router.push(const SearchRoute()),
                      icon: FontAwesomeIcons.magnifyingGlass),
                  CustomIcon(
                    icon: FontAwesomeIcons.bell,
                    onTap: () {
                      final data = ref.read(testProvider);
                      log("==1=====$data=======");
                      final data2 = ref.read(testProvider.notifier);
                      log("==2=====$data2=======");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
