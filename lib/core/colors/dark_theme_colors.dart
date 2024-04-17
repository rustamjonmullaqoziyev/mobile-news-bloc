import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/core/colors/static_colors.dart';
import 'package:mobile_news_with_bloc/core/colors/theme_colors.dart';

@lazySingleton
class DarkThemeColors extends ThemeColors {
  @override
  Color get colorBackgroundPrimary => StaticColors.black;
}
