import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app.dart';
import 'package:news_app/data/sharedprefrance/shared_pref_helper.dart';
import 'package:news_app/provider/theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();

  final container = ProviderContainer();
  await container.read(themeProvider.notifier).init();
  runApp(UncontrolledProviderScope(
    container: container,
    child: DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  ));
}
