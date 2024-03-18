part of 'detail_bloc.dart';

abstract class DetailState {}

@freezed
class DetailBuildable extends DetailState with _$DetailBuildable {
  const factory DetailBuildable() = _DetailBuildable;
}

@freezed
class DetailListenable extends DetailState with _$DetailListenable {
  const factory DetailListenable({
    required DetailEffect effect,
    String? message,
  }) = _DetailListenable;
}

enum DetailEffect { error, success, navigation }

