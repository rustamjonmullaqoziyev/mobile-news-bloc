import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/core/colors/theme_colors.dart';

@lazySingleton
class DarkThemeColors extends ThemeColors {
  @override
  Color get colorBackgroundPrimary => const Color(0xFF171616);

  @override
  Color get colorCardBackground => const Color(0xFF393939);

  @override
  Color get colorBottomBorder => Colors.black;

  @override
  Color get colorTextPrimary => Colors.white;

  @override
  Color get colorShimmerBase => Colors.grey[850]!;

  @override
  Color get colorShimmerHighlight => Colors.grey[700]!;

  @override
  Color get colorIcon => Colors.white;
}
