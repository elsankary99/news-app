import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/screen/widget/home_widgets/custom_icon.dart';

class SearchPageAppBar extends StatelessWidget {
  const SearchPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Row(
            children: [
              CustomIcon(
                  onTap: () => context.router.pop(),
                  icon: FontAwesomeIcons.chevronLeft),
            ],
          ),
        ),
      ),
    );
  }
}
