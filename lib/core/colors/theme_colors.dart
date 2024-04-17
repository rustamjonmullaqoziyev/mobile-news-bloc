import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/core/colors/static_colors.dart';

@lazySingleton
class ThemeColors {
  Color get colorBackgroundPrimary => StaticColors.white;
}
