import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/screen/widget/custom_bottom_navbar.dart';
import 'package:news_app/screen/widget/custom_icon.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GButton> tabs = const [
    GButton(
      icon: FontAwesomeIcons.house,
      text: 'Home',
    ),
    GButton(
      icon: FontAwesomeIcons.globe,
      text: 'Likes',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIcon(icon: FontAwesomeIcons.bars),
                  Row(
                    children: [
                      CustomIcon(icon: FontAwesomeIcons.magnifyingGlass),
                      CustomIcon(icon: FontAwesomeIcons.bell),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(),
      bottomNavigationBar: CustomBottomNavigationBar(tabs: tabs),
    );
  }
}
