
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import 'bloc/main_bloc.dart';
import 'main_view.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => getIt<MainBloc>(),
      child: BlocListener<MainBloc, MainState>(
          listenWhen: (_, state) => state is MainListenable,
          listener: (context, listenable) {},
          child: const MainView(),
        ),
    );
  }
}