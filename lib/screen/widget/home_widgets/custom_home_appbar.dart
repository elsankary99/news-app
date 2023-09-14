import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/router/app_router.dart';
import 'package:news_app/screen/widget/home_widgets/custom_icon.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomIcon(icon: FontAwesomeIcons.bars),
              Row(
                children: [
                  CustomIcon(
                      onTap: () => context.router.push(const SearchRoute()),
                      icon: FontAwesomeIcons.magnifyingGlass),
                  const CustomIcon(icon: FontAwesomeIcons.bell),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
