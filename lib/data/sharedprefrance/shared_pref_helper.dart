import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences sharedPreferences;
  static Future<void> init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static Future<void> setData(bool isDark) async =>
      await sharedPreferences.setBool("isDark", isDark);

  static bool? getData() => sharedPreferences.getBool("isDark");
}
