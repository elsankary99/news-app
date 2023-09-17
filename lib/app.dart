import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
    );
  }
}
