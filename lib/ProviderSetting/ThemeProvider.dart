import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData();

  ThemeData dark = ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          titleTextStyle:
              TextStyle(fontStyle: FontStyle.italic, fontSize: 20)));

  ThemeData light = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          titleTextStyle:
              TextStyle(fontStyle: FontStyle.italic, fontSize: 20)));

  ThemeProvider({required bool darkThemeOn}) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}
