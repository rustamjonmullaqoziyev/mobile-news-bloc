import 'package:flutter/material.dart';
import 'package:mobile_news_with_bloc/core/colors/dark_theme_colors.dart';
import 'package:mobile_news_with_bloc/core/colors/theme_colors.dart';

import '../di/injection.dart';

extension ColorExtension on BuildContext {
  bool get isDarkMode => MediaQuery.of(this).platformBrightness == Brightness.dark;

  ThemeColors get colors =>
      MediaQuery.of(this).platformBrightness == Brightness.dark ? getIt<DarkThemeColors>() : getIt<ThemeColors>();
}
