import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/screen/view/home/global_news.dart';
import 'package:news_app/screen/view/home/home_page.dart';
import 'package:news_app/screen/widget/home_widgets/custom_bottom_navbar.dart';
import 'package:news_app/screen/widget/home_widgets/custom_home_appbar.dart';

@RoutePage()
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  List<GButton> tabs = const [
    GButton(
      icon: FontAwesomeIcons.house,
      text: 'Home',
    ),
    GButton(
      icon: FontAwesomeIcons.globe,
      text: 'Global',
    ),
    GButton(
      icon: FontAwesomeIcons.bookmark,
      text: 'Search',
    ),
    GButton(
      icon: FontAwesomeIcons.user,
      text: 'Profile',
    )
  ];

  List<Widget> children = [
    const HomePage(),
    const GlobalNewsPage(),
    const Center(child: Text("3")),
    const Center(child: Text("4")),
  ];
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {
          selectedIndex = tabController.index;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: const CustomHomeAppBar(),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: children,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        tabs: tabs,
        selectedIndex: selectedIndex,
        onTabChange: (page) {
          tabController.animateTo(
            page, curve: Curves.bounceInOut, // tab animation curves
            duration: const Duration(milliseconds: 300),
          );
          log("====$page===");
        },
      ),
    );
  }
}
