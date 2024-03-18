import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import 'bloc/dashboard_bloc.dart';
import 'dashboard_view.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => getIt<DashboardBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: BlocListener<DashboardBloc, DashboardState>(
          listenWhen: (_, state) => state is DashboardListenable,
          listener: (context, listenable) {},
          child: const DashboardView(),
        ),
      ),
    );
  }
}
