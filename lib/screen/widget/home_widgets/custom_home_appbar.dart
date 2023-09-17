import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/screen/widget/home_widgets/custom_icon.dart';

class CustomHomeAppBar extends ConsumerWidget {
  const CustomHomeAppBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIcon(
                icon: false
                    ? FontAwesomeIcons.solidSun
                    : FontAwesomeIcons.solidMoon,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
