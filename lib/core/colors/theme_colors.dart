import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/core/colors/static_colors.dart';

@lazySingleton
class ThemeColors {
  Color get colorBackgroundPrimary => StaticColors.backgroundColor;

  Color get colorCardBackground => Colors.white;

  Color get colorBottomBorder => Colors.white;

  Color get colorTextPrimary => Colors.black;

  Color get colorShimmerBase => Colors.grey[300]!;

  Color get colorShimmerHighlight =>Colors.grey[100]!;

  Color get colorIcon => Colors.black;
}
