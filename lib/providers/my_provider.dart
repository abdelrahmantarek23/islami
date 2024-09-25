import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('appTheme');
    if (theme != null) {
      appTheme = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  MyProvider() {
    loadTheme();
  }

  changeTheme(ThemeMode themeMode) async {
    appTheme = themeMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'appTheme', themeMode == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }
}
