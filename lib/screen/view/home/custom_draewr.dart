import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/router/app_router.dart';
import 'package:news_app/screen/widget/home_widgets/drawer_card.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset(
                "assets/images/news.png",
                color: Colors.white,
              )),
          DrawerCard(
              icon: FontAwesomeIcons.newspaper,
              title: 'Breaking News',
              onTap: () {
                context.router.push(const BreakingNewsRoute());
              }),
          DrawerCard(
              icon: FontAwesomeIcons.fire,
              title: 'Recommendation',
              onTap: () {
                context.router.push(const RecommendationRoute());
              }),
          DrawerCard(
              icon: FontAwesomeIcons.magnifyingGlass,
              title: 'Search a News',
              onTap: () {
                context.router.push(const SearchRoute());
              }),
        ],
      ),
    );
  }
}
