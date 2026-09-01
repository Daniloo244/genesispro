import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  double _fontScale = 1.0;

  ThemeMode get themeMode => _themeMode;
  double get fontScale => _fontScale;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setFontScale(double scale) {
    _fontScale = scale.clamp(0.8, 1.5);
    notifyListeners();
  }

  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF0066CC),
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF0066CC),
      secondary: const Color(0xFFE50914),
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0066CC),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF0066CC),
      secondary: const Color(0xFFE50914),
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
  );
}
