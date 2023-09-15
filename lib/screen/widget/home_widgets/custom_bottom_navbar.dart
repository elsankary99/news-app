import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/core/constant/app_color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.tabs,
    required this.onTabChange,
    required this.selectedIndex,
  });

  final List<GButton> tabs;
  final void Function(int) onTabChange;
  final int selectedIndex;
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
              top:
                  BorderSide(color: AppColor.grey.withOpacity(0.2), width: 2))),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          child: GNav(
              selectedIndex: selectedIndex,
              onTabChange: onTabChange,
              haptic: true,
              tabBorderRadius: 30,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              gap: 12,
              color: AppColor.grey,
              activeColor: Theme.of(context).cardColor,
              iconSize: 20,
              tabBackgroundColor: AppColor.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              tabs: tabs),
        ),
      ),
    );
  }
}
