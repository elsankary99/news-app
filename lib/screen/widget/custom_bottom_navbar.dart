import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/core/constant/app_color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.tabs,
  });

  final List<GButton> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 50,
              blurStyle: BlurStyle.outer,
              color: Colors.white,
            ),
          ],
          border: Border(
              top: BorderSide(
                  color: AppColor.lightGrey.withOpacity(0.2), width: 2))),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          child: GNav(
              haptic: true, // haptic feedback
              tabBorderRadius: 30,
              curve: Curves.easeInOut, // tab animation curves
              duration:
                  const Duration(milliseconds: 300), // tab animation duration
              gap: 12, // the tab button gap between icon and text
              color: AppColor.lightGrey, // unselected icon color
              activeColor:
                  Theme.of(context).cardColor, // selected icon and text color
              iconSize: 20, // tab button icon size
              tabBackgroundColor:
                  AppColor.primaryColor, // selected tab background color
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10), // navigation bar padding
              tabs: tabs),
        ),
      ),
    );
  }
}
