part of 'dashboard_bloc.dart';

abstract class DashboardState {}

@freezed
class DashboardBuildable extends DashboardState with _$DashboardBuildable {
  const factory DashboardBuildable() = _DashboardBuildable;
}

@freezed
class DashboardListenable extends DashboardState with _$DashboardListenable {
  const factory DashboardListenable({
    required DashboardEffect effect,
    String? message,
  }) = _DashboardListenable;
}

enum DashboardEffect { error, success, navigation }
