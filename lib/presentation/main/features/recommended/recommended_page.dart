import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_news_with_bloc/presentation/main/features/recommended/recommended_view.dart';

import '../../../../core/di/injection.dart';
import 'bloc/recommended_bloc.dart';

@RoutePage()
class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (_) => getIt<RecommendedBloc>(),
        child: BlocListener<RecommendedBloc, RecommendedState>(
          listenWhen: (_, state) => state is RecommendedListenable,
          listener: (context, listenable) {},
          child: const RecommendedView(),
        ));
  }
}
