import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/sharedprefrance/shared_pref_helper.dart';
part 'theme_state.dart';

final themeProvider =
    StateNotifierProvider<ThemeProvider, ThemeState>((ref) => ThemeProvider());

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider() : super(ThemeInitial());
  bool? isDark;
  init() {
    isDark = SharedPreferenceHelper.getData();
  }

  Future<void> setData(bool isDark) async {
    state = ThemeLoading();
    try {
      await SharedPreferenceHelper.setData(isDark);
      this.isDark = isDark;
      state = ThemeDataFetched();
    } catch (e) {
      state = ThemeError(e.toString());
    }
  }
}
