// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardBuildable {}

/// @nodoc
abstract class $DashboardBuildableCopyWith<$Res> {
  factory $DashboardBuildableCopyWith(
          DashboardBuildable value, $Res Function(DashboardBuildable) then) =
      _$DashboardBuildableCopyWithImpl<$Res, DashboardBuildable>;
}

/// @nodoc
class _$DashboardBuildableCopyWithImpl<$Res, $Val extends DashboardBuildable>
    implements $DashboardBuildableCopyWith<$Res> {
  _$DashboardBuildableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DashboardBuildableImplCopyWith<$Res> {
  factory _$$DashboardBuildableImplCopyWith(_$DashboardBuildableImpl value,
          $Res Function(_$DashboardBuildableImpl) then) =
      __$$DashboardBuildableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardBuildableImplCopyWithImpl<$Res>
    extends _$DashboardBuildableCopyWithImpl<$Res, _$DashboardBuildableImpl>
    implements _$$DashboardBuildableImplCopyWith<$Res> {
  __$$DashboardBuildableImplCopyWithImpl(_$DashboardBuildableImpl _value,
      $Res Function(_$DashboardBuildableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardBuildableImpl implements _DashboardBuildable {
  const _$DashboardBuildableImpl();

  @override
  String toString() {
    return 'DashboardBuildable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardBuildableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _DashboardBuildable implements DashboardBuildable {
  const factory _DashboardBuildable() = _$DashboardBuildableImpl;
}

/// @nodoc
mixin _$DashboardListenable {
  DashboardEffect get effect => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardListenableCopyWith<DashboardListenable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardListenableCopyWith<$Res> {
  factory $DashboardListenableCopyWith(
          DashboardListenable value, $Res Function(DashboardListenable) then) =
      _$DashboardListenableCopyWithImpl<$Res, DashboardListenable>;
  @useResult
  $Res call({DashboardEffect effect, String? message});
}

/// @nodoc
class _$DashboardListenableCopyWithImpl<$Res, $Val extends DashboardListenable>
    implements $DashboardListenableCopyWith<$Res> {
  _$DashboardListenableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effect = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as DashboardEffect,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardListenableImplCopyWith<$Res>
    implements $DashboardListenableCopyWith<$Res> {
  factory _$$DashboardListenableImplCopyWith(_$DashboardListenableImpl value,
          $Res Function(_$DashboardListenableImpl) then) =
      __$$DashboardListenableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardEffect effect, String? message});
}

/// @nodoc
class __$$DashboardListenableImplCopyWithImpl<$Res>
    extends _$DashboardListenableCopyWithImpl<$Res, _$DashboardListenableImpl>
    implements _$$DashboardListenableImplCopyWith<$Res> {
  __$$DashboardListenableImplCopyWithImpl(_$DashboardListenableImpl _value,
      $Res Function(_$DashboardListenableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effect = null,
    Object? message = freezed,
  }) {
    return _then(_$DashboardListenableImpl(
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as DashboardEffect,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DashboardListenableImpl implements _DashboardListenable {
  const _$DashboardListenableImpl({required this.effect, this.message});

  @override
  final DashboardEffect effect;
  @override
  final String? message;

  @override
  String toString() {
    return 'DashboardListenable(effect: $effect, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardListenableImpl &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, effect, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardListenableImplCopyWith<_$DashboardListenableImpl> get copyWith =>
      __$$DashboardListenableImplCopyWithImpl<_$DashboardListenableImpl>(
          this, _$identity);
}

abstract class _DashboardListenable implements DashboardListenable {
  const factory _DashboardListenable(
      {required final DashboardEffect effect,
      final String? message}) = _$DashboardListenableImpl;

  @override
  DashboardEffect get effect;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$DashboardListenableImplCopyWith<_$DashboardListenableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
