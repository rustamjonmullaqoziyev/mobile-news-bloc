part of 'main_bloc.dart';

abstract class MainState {}

@freezed
class MainBuildable extends MainState with _$MainBuildable {
  const factory MainBuildable(
      {Language? language, @Default(true) bool isDark}) = _MainBuildable;
}

@freezed
class MainListenable extends MainState with _$MainListenable {
  const factory MainListenable() = _MainListenable;
}

enum MainEffect { error, success, navigation }

enum Language { en, ru, uz }
