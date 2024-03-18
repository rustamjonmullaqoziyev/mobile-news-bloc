part of 'read_later_bloc.dart';

abstract class ReadLaterState {}

@freezed
class ReadLaterBuildable extends ReadLaterState with _$ReadLaterBuildable {
  const factory ReadLaterBuildable() = _ReadLaterBuildable;
}

@freezed
class ReadLaterListenable extends ReadLaterState with _$ReadLaterListenable {
  const factory ReadLaterListenable({
    required ReadLaterEffect effect,
    String? message,
  }) = _ReadLaterListenable;
}

enum ReadLaterEffect { error, success, navigation }