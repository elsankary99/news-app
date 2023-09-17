import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/provider/theme_provider/theme_provider.dart';
import 'package:news_app/screen/widget/home_widgets/custom_icon.dart';

class CustomHomeAppBar extends ConsumerStatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  ConsumerState<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends ConsumerState<CustomHomeAppBar> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    ref.watch(themeProvider);
    final bool active = ref.read(themeProvider.notifier).isDark ?? false;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIcon(
                icon: !active
                    ? FontAwesomeIcons.solidSun
                    : FontAwesomeIcons.solidMoon,
                color: !active ? Colors.orange : Colors.black,
                onTap: () async {
                  setState(() {
                    isDark = !isDark;
                  });
                  await ref.read(themeProvider.notifier).setData(isDark);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
