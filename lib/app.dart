import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/router/app_router.dart';
import 'package:news_app/provider/theme_provider/theme_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeProvider.select((state) => state is ThemeDataFetched));
    final bool isDark = ref.read(themeProvider.notifier).isDark ?? false;
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: isDark
          ? ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: AppColor.primaryColor,
              hintColor: Colors.black,
            )
          : ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              hintColor: Colors.white,
              primaryColor: Colors.orange,
            ),
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
    );
  }
}
