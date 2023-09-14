import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/screen/widget/custom_icon.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
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
    );
  }
}
