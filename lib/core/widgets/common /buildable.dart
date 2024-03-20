import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class Buildable<BLOC extends StateStreamable<STATE>, STATE, BUILDABLE>
    extends StatelessWidget {

  final List<Object?> Function(BUILDABLE) properties;
  final Widget Function(BuildContext context, BUILDABLE buildable) builder;

  Buildable({
    Key? key,
    required this.properties,
    required this.builder,
  }) : super(key: key);

  final Function equals = const DeepCollectionEquality().equals;

  @override
  Widget build(BuildContext context) {
    List<Object?>? built;
    return BlocBuilder<BLOC, STATE>(
      buildWhen: (_, current) {
        if (current is! BUILDABLE) return false;
        return !equals(built, properties(current));
      },
      builder: (context, state) {
        built = properties(state as BUILDABLE);
        return builder(context, state);
      },
    );
  }
}
